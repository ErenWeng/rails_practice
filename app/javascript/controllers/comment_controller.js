// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['content', 'submit']

  connect() {
    console.log('cc')
  }

  check() {
    if (this.contentTarget.value.length > 1) {
      this.submitTarget.disabled = false;
    } else {
      this.submitTarget.disabled = true;
    }
  };

}
