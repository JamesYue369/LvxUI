import Picker from '../picker';
import Panel from '../panel/time-select';

export default {
  mixins: [Picker],

  name: 'TimeSelect',

  beforeCreate() {
    this.type = 'time-select';
    this.panel = Panel;
  }
};
