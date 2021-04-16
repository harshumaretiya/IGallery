/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/nested-forms/addFields.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/nested-forms/addFields.js":
/*!********************************************************!*\
  !*** ./app/javascript/packs/nested-forms/addFields.js ***!
  \********************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

var addFields = /*#__PURE__*/function () {
  // This executes when the function is instantiated.
  function addFields() {
    _classCallCheck(this, addFields);

    this.links = document.querySelectorAll(".add_fields");
    this.iterateLinks();
  }

  _createClass(addFields, [{
    key: "iterateLinks",
    value: function iterateLinks() {
      var _this = this;

      // If there are no links on the page, stop the function from executing.
      if (this.links.length === 0) return; // Loop over each link on the page. A page could have multiple nested forms.

      this.links.forEach(function (link) {
        link.addEventListener("click", function (e) {
          _this.handleClick(link, e);
        });
      });
    }
  }, {
    key: "handleClick",
    value: function handleClick(link, e) {
      // Stop the function from executing if a link or event were not passed into the function.
      if (!link || !e) return; // Prevent the browser from following the URL.

      e.preventDefault(); // Save a unique timestamp to ensure the key of the associated array is unique.

      var time = new Date().getTime(); // Save the data id attribute into a variable. This corresponds to `new_object.object_id`.

      var linkId = link.dataset.id; // Create a new regular expression needed to find any instance of the `new_object.object_id` used in the fields data attribute if there's a value in `linkId`.

      var regexp = linkId ? new RegExp(linkId, "g") : null; // Replace all instances of the `new_object.object_id` with `time`, and save markup into a variable if there's a value in `regexp`.

      var newFields = regexp ? link.dataset.fields.replace(regexp, time) : null; // Add the new markup to the form if there are fields to add.

      newFields ? link.insertAdjacentHTML("beforebegin", newFields) : null;
    }
  }]);

  return addFields;
}(); // Wait for turbolinks to load, otherwise `document.querySelectorAll()` won't work


window.addEventListener("turbolinks:load", function () {
  return new addFields();
});

/***/ })

/******/ });
//# sourceMappingURL=addFields-6b5d7d5c27df36b8236e.js.map