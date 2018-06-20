<script>
import ajax from './ajax';
import UploadDragger from './upload-dragger.vue';
import _ from 'lodash';
export default {
  inject: ['uploader'],
  components: {
    UploadDragger
  },
  props: {
    type: String,
    action: {
      type: String,
      required: true
    },
    name: {
      type: String,
      default: 'file'
    },
    data: Object,
    headers: Object,
    withCredentials: Boolean,
    multiple: Boolean,
    accept: String,
    onStart: Function,
    onProgress: Function,
    onSuccess: Function,
    onError: Function,
    onDisallow: Function,
    onSpill: Function,
    beforeUpload: Function,
    drag: Boolean,
    onPreview: {
      type: Function,
      default: function() {}
    },
    onRemove: {
      type: Function,
      default: function() {}
    },
    fileList: Array,
    autoUpload: Boolean,
    listType: String,
    httpRequest: {
      type: Function,
      default: ajax
    },
    disabled: Boolean,
    limit: Number,
    onExceed: Function,
    size: Number
  },

  data() {
    return {
      mouseover: false,
      reqs: {}
    };
  },

  methods: {
    isImage(str) {
      return str.indexOf('image') !== -1;
    },
    handleChange(ev) {
      const files = ev.target.files;

      if (!files) return;
      this.uploadFiles(files);
    },
    uploadFiles(files) {
      // debugger
      // 校验文件类型
      if (!this.multiple) {
        if (this.accept) {
          // 存在文件类型字符
          if (files[0].type) {
            let index = _.findIndex(this.accept.split(','), function(o) {
              return o === files[0].type;
            });
            if (index < 0) {
              this.onDisallow(files);
              return;
            }
          } else {
            // 目前发现docx格式的文件type为空,为解决此问题以下代码
            if (this.accept.includes('application/vnd.openxmlformats-officedocument.wordprocessingml.document')) {
              if (files[0].name.search('.docx') < 0) {
                this.onDisallow(files);
                return;
              }
            }
          }
        }
      } else {
        if (this.accept) {
          let disallowFlag = false;
          _.forEach(files, (value)=> {
            // 存在文件类型字符
            if (value.type) {
              let index = _.findIndex(this.accept.split(','), function(o) {
                return o === value.type;
              });
              if (index < 0) {
                disallowFlag = true;
                this.onDisallow(value);
                return false;
              }
            } else {
              // 目前发现docx格式的文件type为空,为解决此问题以下代码
              if (this.accept.includes('application/vnd.openxmlformats-officedocument.wordprocessingml.document')) {
                if (value.name.search('.docx') < 0) {
                  disallowFlag = true;
                  this.onDisallow(value);
                  return false;
                }
              }
            }
          });
          if (disallowFlag) {
            return;
          }
        }
      }
      // 校验文件大小
      if (!this.multiple) {
        if (this.size) {
          if (files[0].size > this.size) {
            this.onSpill(files);
            return;
          }
        }
      } else {
        if (this.size) {
          let spillFlag = false;
          _.forEach(files, (value)=> {
            if (value.size > this.size) {
              spillFlag = true;
              this.onSpill(value);
              return false;
            }
          });
          if (spillFlag) {
            return;
          }
        }
      }
      // 校验文件个数
      if (this.limit && this.fileList.length + files.length > this.limit) {
        this.onExceed && this.onExceed(files, this.fileList);
        return;
      }
      let postFiles = Array.prototype.slice.call(files);
      if (!this.multiple) { postFiles = postFiles.slice(0, 1); }

      if (postFiles.length === 0) { return; }

      postFiles.forEach(rawFile => {
        this.onStart(rawFile);
        if (this.autoUpload) this.upload(rawFile);
      });
    },
    upload(rawFile, file) {
      this.$refs.input.value = null;

      if (!this.beforeUpload) {
        return this.post(rawFile);
      }

      const before = this.beforeUpload(rawFile);
      if (before && before.then) {
        before.then(processedFile => {
          const fileType = Object.prototype.toString.call(processedFile);
          if (fileType === '[object File]' || fileType === '[object Blob]') {
            this.post(processedFile);
          } else {
            this.post(rawFile);
          }
        }, () => {
          this.onRemove(null, rawFile);
        });
      } else if (before !== false) {
        this.post(rawFile);
      } else {
        this.onRemove(null, rawFile);
      }
    },
    abort(file) {
      const { reqs } = this;
      if (file) {
        let uid = file;
        if (file.uid) uid = file.uid;
        if (reqs[uid]) {
          reqs[uid].abort();
        }
      } else {
        Object.keys(reqs).forEach((uid) => {
          if (reqs[uid]) reqs[uid].abort();
          delete reqs[uid];
        });
      }
    },
    post(rawFile) {
      const { uid } = rawFile;
      const options = {
        headers: this.headers,
        withCredentials: this.withCredentials,
        file: rawFile,
        data: this.data,
        filename: this.name,
        action: this.action,
        onProgress: e => {
          this.onProgress(e, rawFile);
        },
        onSuccess: res => {
          this.onSuccess(res, rawFile);
          delete this.reqs[uid];
        },
        onError: err => {
          this.onError(err, rawFile);
          delete this.reqs[uid];
        }
      };
      const req = this.httpRequest(options);
      this.reqs[uid] = req;
      if (req && req.then) {
        req.then(options.onSuccess, options.onError);
      }
    },
    handleClick() {
      if (!this.disabled) {
        this.$refs.input.value = null;
        this.$refs.input.click();
      }
    },
    handleKeydown(e) {
      if (e.keyCode === 13 || e.keyCode === 32) {
        this.handleClick();
      }
    }
  },

  render(h) {
    let {
      handleClick,
      drag,
      name,
      handleChange,
      multiple,
      accept,
      listType,
      uploadFiles,
      disabled,
      handleKeydown
    } = this;
    const data = {
      class: {
        [`${this.$clsPrefix}-upload`]: true
      },
      on: {
        click: handleClick,
        keydown: handleKeydown
      }
    };
    data.class[`${this.$clsPrefix}-upload--${listType}`] = true;
    return (
      <div {...data} tabindex="0" >
        {
          drag
          ? <upload-dragger disabled={disabled} on-file={uploadFiles}>{this.$slots.default}</upload-dragger>
          : this.$slots.default
        }
        <input class={`${this.$clsPrefix}-upload__input`} type="file" ref="input" name={name} on-change={handleChange} multiple={multiple} accept={accept}></input>
      </div>
    );
  }
};
</script>
