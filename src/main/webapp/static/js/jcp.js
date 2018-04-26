var JCP = {
	setup : {
		download : "http://print.jatools.com/jcp/setup.exe",
		noSetupMessage : "杰表云打印（JCP）未安装, 请下载安装之."
	}
}
var X = "www.jatools.com";
function j(aq, forward, password) {
	var V = JSON.parse || function(str) {
		if (str === "")
			str = '""';
		eval("var p=" + str + ";");
		return p;
	};
	function log(e) {
	}
	;
	function ajax(url, data, aa, result) {
		try {
			if (data && typeof (data) === 'object') {
				data.tab = ai || "";
				data = JSONstringify(data);
			}
			var x = new (window.XDomainRequest || window.XMLHttpRequest || ActiveXObject)(
					'MSXML2.XMLHTTP.3.0');
			x.open(data ? 'POST' : 'GET', url, 1);
			if (window.XDomainRequest) {
				x.onload = function() {
					var data = V(x.responseText || "{}");
					if (result) {
						data = typeof (data.result) == "undefined" ? ""
								: data.result;
					}
					aa && aa(data, x.responseText, 200);
				};
				x.au = function() {
					aa && aa(data, x.responseText, 404);
				};
				x.onerror = function() {
					aa && aa(data, x.responseText, 404);
				};
				x.send(data)
			} else {
				x.onreadystatechange = function() {
					try {
						var data = V(x.responseText || "{}");
						if (result) {
							data = typeof (data.result) == "undefined" ? ""
									: data.result;
						}
						x.readyState > 3 && aa
								&& aa(data, x.responseText, x.status);
					} catch (e) {
						log(e);
					}
				};
				x.send(data)
			}
		} catch (e) {
			log(e);
		}
	}
	;
	function l(ad, id) {
		return ad.getElementById(id);
	}
	;
	function m(d) {
		var b = "";
		var e = d.styleSheets;
		for (var g = 0; g < e.length; g++) {
			var h = e[g];
			try {
				var c = h.cssRules;
				if (c) {
					for (var a = 0; a < c.length; a++) {
						b += c[a].cssText || ""
					}
				} else {
					if (h.cssText) {
						b += h.cssText
					}
				}
			} catch (f) {
			}
		}
		return (b + "").replace(/[\s]*\n/gm, "");
	}
	;
	function D(ad, node) {
		if (ad.doctype)
			node.setAttribute('_strict', 'true');
		return node.outerHTML || (function(n) {
			var div = ad.createElement('div'), h;
			div.appendChild(n.cloneNode(true));
			h = div.innerHTML;
			div = null;
			return h;
		})(node);
	}
	;
	var aC;
	function F(ad, myDoc) {
		if (typeof (ad.getElementById) != 'undefined') {
			var html = '';
			var result = {
				style : m(ad)
			};
			if (myDoc.jobPages) {
			} else {
				var i = 0;
				while (true) {
					var page = l(ad, 'page' + (i + 1));
					if (!page)
						break;
					html += D(ad, page);
					i++;
				}
			}
			result.pages = html;
			result.valid = true;
			return result;
		} else {
			return ad;
		}
	}
	;
	function C(myDoc) {
		myDoc.documents = w(myDoc);
		return myDoc;
	}
	;
	function B(myDoc, aa) {
		var ae = myDoc.documents;
		var ar = false;
		if (ae.substring) {
			ar = true;
			ae = [ ae ];
		}
		var needs = 0;
		var wrapper = document.getElementById("_jp_wrapper");
		if (!wrapper) {
			wrapper = document.createElement("div");
			wrapper.style.position = 'absolute';
			wrapper.style.left = '-3000px';
			wrapper.style.width = '2500px';
			wrapper.id = '_jp_wrapper';
			document.body.appendChild(wrapper);
		} else
			wrapper.innerHTML = '';
		var loaded = function() {
			if (true || (event.srcElement.readyState || '') == "complete") {
				ae[event.srcElement.ownerIndex] = event.srcElement.contentWindow.document;
				needs--;
				if (needs == 0) {
					if (ar) {
						myDoc.documents = ae[0];
					}
					aa();
				}
			}
		};
		if (typeof (ae.push) != 'undefined') {
			for (var i = 0; i < ae.length; i++) {
				if (ae[i].substring) {
					needs++;
					var frame = document.createElement("iframe");
					frame.ownerIndex = i;
					if (frame.attachEvent) {
						frame.attachEvent("onload", loaded);
					} else {
						frame.onload = loaded;
					}
					frame.src = ae[i];
					wrapper.appendChild(frame);
				}
			}
		} else {
			if (ar) {
				myDoc.documents = ae[0];
			}
			aa();
		}
	}
	;
	function G(target) {
		var properties = [ 'border', 'border-radius', 'box-shadow', 'height',
				'margin', 'padding', 'width2', 'max-width', 'min-width',
				'border-collapse', 'border-spacing', 'caption-side',
				'empty-cells', 'table-layout', 'direction', 'font',
				'font-family', 'font-style', 'font-variant', 'font-size',
				'font-weight', 'letter-spacing', 'line-height', 'text-align',
				'text-decoration', 'text-indent', 'text-overflow',
				'text-shadow', 'text-transform', 'white-space', 'word-spacing',
				'word-wrap', 'vertical-align', 'color', 'background',
				'background-color', 'background-image', 'background-position',
				'background-repeat', 'Opacity', 'bottom', 'clear', 'clip',
				'cursor', 'display', 'float', 'left', 'opacity', 'outline ',
				'overflow', 'position', 'resize ', 'right', 'top',
				'visibility', 'z-index', 'list-style-image',
				'list-style-position', 'list-style-type' ];
		var elements = target.getElementsByTagName('*');
		for (var e = 0; e < elements.length; e++) {
			var el = elements.item(e);
			if (el.tagName == 'IMG') {
				el.src = el.src;
			}
			var thisProps = (el.getAttribute("style") || '').split(";");
			for (var p = 0; p < properties.length; p++) {
				var thisProp = properties[p];
				var thisValue = null;
				if (el.currentStyle) {
					thisValue = el.currentStyle[thisProp];
				} else if (window.getComputedStyle) {
					if (window.getComputedStyle.getPropertyValue) {
						thisValue = window.getComputedStyle(el, null)
								.getPropertyValue(thisProp)
					} else {
						thisValue = window.getComputedStyle(el)[thisProp]
					}
					;
				}
				if (thisValue) {
					el.style[thisProp] = thisValue;
				}
			}
		}
	}
	;
	function w(myDoc) {
		var ae = myDoc.documents, result = null;
		return F(ae, myDoc);
	}
	;
	function t(target) {
		var result = "<html><head><style>" + m(target.ownerDocument)
				+ "</style></head><body>" + D(target.ownerDocument, target)
				+ '</body></html>';
		return result;
	}
	;
	function A(ad) {
		var result = "<html><head><base href='" + ad.URL + "'/><style>" + m(ad)
				+ "</style></head><body>" + ad.body.innerHTML
				+ '</body></html>';
		return result;
	}
	;
	var lut = [];
	for (var i = 0; i < 256; i++) {
		lut[i] = (i < 16 ? '0' : '') + (i).toString(16);
	}
	function K() {
		var d0 = Math.random() * 0xffffffff | 0;
		var d1 = Math.random() * 0xffffffff | 0;
		var d2 = Math.random() * 0xffffffff | 0;
		var d3 = Math.random() * 0xffffffff | 0;
		return lut[d0 & 0xff] + lut[d0 >> 8 & 0xff] + lut[d0 >> 16 & 0xff]
				+ lut[d0 >> 24 & 0xff] + '-' + lut[d1 & 0xff]
				+ lut[d1 >> 8 & 0xff] + '-' + lut[d1 >> 16 & 0x0f | 0x40]
				+ lut[d1 >> 24 & 0xff] + '-' + lut[d2 & 0x3f | 0x80]
				+ lut[d2 >> 8 & 0xff] + '-' + lut[d2 >> 16 & 0xff]
				+ lut[d2 >> 24 & 0xff] + lut[d3 & 0xff] + lut[d3 >> 8 & 0xff]
				+ lut[d3 >> 16 & 0xff] + lut[d3 >> 24 & 0xff];
	}
	;
	function empty(json) {
		for (p in json) {
			return false;
		}
		return true;
	}
	;
	function Q(myDoc) {
		var ah = [ "done", "onState", "listener", "onPagePrinted" ];
		for (var i = 0; i < ah.length; i++) {
			var e = ah[i];
			if (myDoc[e]) {
				myDoc[e] = P(myDoc[e], false, i > 0);
				myDoc._hasCallback = true;
			}
		}
		if (myDoc.dragDesigner && myDoc.dragDesigner.ok) {
			myDoc.dragDesigner.ok = P(myDoc.dragDesigner.ok);
			myDoc._hasCallback = true;
		}
	}
	;
	var ac;
	var private_url;
	var aj = [];
	aj[3] = "http://" + aq + ":31227/api?type=service&";
	aj[4] = "http://" + aq + ":31227/api?type=admin&";
	var ab = {};
	var ag = 0;
	var ai;
	var ax;
	function U() {
		setTimeout(function() {
			ajax(aj[1] + 'type=TICK&', {}, function(data, text, status) {
				if (status != 200 || data["api-error"]) {
					on = false;
					return;
				}
				U();
			});
		}, 30000);
	}
	;
	function O() {
		ax = true;
		ajax(aj[1] + 'type=PULL&', {}, function(data, text, status) {
			if (status != 200 || data["api-error"]) {
				on = false;
				return;
			}
			try {
				if (data.event) {
					ab[data.event].apply(null, data.params || [ data.data ]);
					if (data.event.indexOf("fixed") != 0) {
						delete ab[data.event];
					}
				}
			} catch (e) {
			}
			if (empty(ab)) {
				ax = false;
			} else {
				O();
			}
		});
	}
	;
	var on = false;
	var am = false;
	var al = [];
	function M(aa) {
		aa && al.push(aa);
		if (al.length == 1 || !aa) {
			var at = {
				method : "new",
				lic : typeof (LIC) != 'undefined' ? LIC.key : "",
				base : document.URL
			};
			var an = "";
			if (forward) {
				at.password = password;
				an = "forward=" + forward + "&";
			}
			ajax(
					"http://" + aq + ":31227/api?type=NEW&" + an,
					at,
					function(data, r, status) {
						if (status != 200) {
							var error = ' 杰表云打印（JCP）未安装或未运行.';
							if (!av.silent) {
								if (aq !== '127.0.0.1') {
									alert(error = "无法连接 JCP 站：" + aq);
									return log(error);
								}
								if (JCP.setup) {
									if (JCP.setup.noSetupHandle) {
										JCP.setup.noSetupHandle();
									} else if (!am) {
										if (JCP.setup.noSetupMessage)
											error = JCP.setup.noSetupMessage;
										alert(error);
										if (JCP.setup.download) {
											am = true;
											document.location.href = JCP.setup.download;
											var ak = function() {
												ajax(
														"http://"
																+ aq
																+ ":31227/api?type=service&",
														{
															method : "getVersion"
														}, function(data, r,
																status) {
															if (data.result) {
																M(null);
															} else
																setTimeout(ak,
																		3000);
														});
											};
											setTimeout(ak, 10000);
										}
									}
								} else
									alert(error);
							}
							return log(error);
						} else if (data["api-result"]) {
							on = true;
							ai = data["api-result"];
							af = data["af"];
							aj[0] = "http://" + aq + ":31227/api?af=" + af
									+ "&tab=" + ai + "&use=common" + "&" + an;
							aj[1] = "http://" + aq + ":31227/api?af=" + af
									+ "&tab=" + ai + "&" + an;
							aj[2] = "http://" + aq + ":31227/api?type=UPDATE&";
							aj[3] = "http://" + aq + ":31227/api?type=service&";
							U();
							O();
							if (JCP.setup.version
									&& JCP.setup.version != data["version"]) {
								var ak = function() {
									ajax(aj[3], {
										method : "getVersion"
									}, function(data, r, status) {
										if (data.result != JCP.setup.version) {
											setTimeout(ak, 3000);
										} else {
											M(null);
										}
									});
								};
								getJCP().update(JCP.setup.download,
										JCP.setup.version);
								setTimeout(ak, 3000);
							} else {
								while (al.length) {
									al.shift()();
								}
							}
						} else {
							al.length = 0;
							alert(data["api-error"]);
							return log(data["api-error"]);
						}
					});
		}
	}
	;
	function P(aa, json, fixed) {
		if (aa) {
			var index = fixed ? "fixed" : "event-" + ag++;
			ab[index] = !json ? aa : function(result) {
				result = eval("(" + result + ")");
				aa(result);
			};
			return ai + ":" + index;
		} else
			return "";
	}
	;
	function H(aa) {
		if (!on) {
			M(aa);
		} else {
			aa();
		}
	}
	;
	function I(data, text, status) {
		if (status != 200 || data["api-error"]) {
			if (status == 200
					&& (data["api-error"] == 1003 || data["api-error"] == 'NO_LICENSED_HOST')) {
				var ec = data["ec"] || 0;
				if (ec == 0)
					alert("未经绑定的主机：" + data["host"]);
				else if (ec == 1) {
					alert("本版本为试用版，不支持在 " + data["host"]
							+ " 上试用，请在 127.0.0.1 上试用.");
				} else if (ec == 2) {
					alert("本版本为试用版，在 127.0.0.1上试用到期，购买请联系手机: (0)18969037811 .");
				} else if (ec == 3) {
					alert("不支持当前浏览器，免费版仅支持 IE 及 IE 内核浏览器 .");
				} else if (ec == 4) {
					alert("不要以本地文件方式打开页面，请以 HTTP 或 HTTPS 方式打开（即通过web服务器）.");
				} else if (ec == 5) {
					alert("错误的访问令牌.");
				} else if (ec == 6) {
					alert("This JCP supports chinese simplified OS only.");
				}
				ab = {};
			}
			on = false;
			return;
		}
	}
	;
	function R(target, param, data) {
		(!ax) && O();
		ajax(aj[target] + (param || ''), data, I);
	}
	;
	var new_ = true;
	var av = {};
	var self = null;
	return ((self = {
		"initialize" : function() {
			return this;
		},
		"options" : function(o) {
			if (o) {
				av = o;
				return this;
			} else {
				return av;
			}
		},
		"print" : function(myDoc, prompt) {
			H(function() {
				myDoc = C(myDoc);
				Q(myDoc);
				R(1, null, {
					method : "print",
					params : [ myDoc, prompt ? true : false ]
				});
			});
		},
		"printPreview" : function(myDoc, prompt) {
			H(function() {
				myDoc = C(myDoc);
				Q(myDoc);
				R(1, null, {
					method : "printPreview",
					params : [ myDoc, prompt ? true : false ]
				});
			});
		},
		"getVersion" : function(aa) {
			H(function() {
				R(0, null, {
					method : "getVersion",
					event : P(aa)
				});
			})
		},
		"about" : function() {
			H(function() {
				R(1, null, {
					method : "about"
				});
			})
		},
		"getPapers" : function(printer, aa) {
			H(function() {
				R(0, null, {
					method : "getPapers",
					params : [ printer ],
					event : P(aa)
				});
			})
		},
		"getPrinters" : function(aa) {
			H(function() {
				R(0, null, {
					method : "getPrinters",
					event : P(aa)
				});
			})
		},
		"getDefaultPrinter" : function(aa) {
			H(function() {
				R(0, null, {
					method : "getDefaultPrinter",
					event : P(aa)
				});
			})
		},
		"exit" : function() {
			H(function() {
				R(1, null, {
					method : "exit"
				});
			})
		},
		"emptyCallback" : function() {
		},
		"getAbsoluteURL" : function(relative, base, aa) {
			var stack = base.split("/"), parts = relative.split("/");
			stack.pop();
			for (var i = 0; i < parts.length; i++) {
				if (parts[i] == ".")
					continue;
				if (parts[i] == "..")
					stack.pop();
				else
					stack.push(parts[i]);
			}
			(aa || this.nothing).call(this, stack.join("/"));
		},
		"nothing" : function() {
		},
		"setPrintBackground" : function(back, aa) {
			H(function() {
				R(0, null, {
					method : "setPrintBackground",
					params : [ back ],
					event : P(aa)
				});
			})
		}
	})).initialize();
};
var Z = {};
function getJCP(aq, forward, password) {
	aq = "127.0.0.1";
	var id = aq + (forward || "");
	if (!Z[id]) {
		Z[id] = new j(aq, forward || "", password || "");
	}
	return Z[id];
};
function L() {
	getJP().exit()
};
var JSON = JSON || {};
var JSONstringify = JSON.stringify
		|| (function() {
			"use strict";
			var aA = /[\\"\u0000-\u001f\u007f-\u009f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g;
			function f(n) {
				return n < 10 ? "0" + n : n;
			}
			;
			function T() {
				return this.valueOf();
			}
			;
			if (typeof Date.prototype.aD !== "function") {
				Date.prototype.aD = function() {
					return isFinite(this.valueOf()) ? this.getUTCFullYear()
							+ "-" + f(this.getUTCMonth() + 1) + "-"
							+ f(this.getUTCDate()) + "T"
							+ f(this.getUTCHours()) + ":"
							+ f(this.getUTCMinutes()) + ":"
							+ f(this.getUTCSeconds()) + "Z" : null;
				};
				Boolean.prototype.aD = T;
				Number.prototype.aD = T;
				String.prototype.aD = T;
			}
			var ao;
			var indent;
			var meta;
			var ay;
			function J(string) {
				aA.lastIndex = 0;
				return aA.test(string) ? "\""
						+ string.replace(aA, function(a) {
							var c = meta[a];
							return typeof c === "string" ? c : "\\u"
									+ ("0000" + a.charCodeAt(0).toString(16))
											.slice(-4);
						}) + "\"" : "\"" + string + "\"";
			}
			;
			function str(key, ap) {
				var i;
				var k;
				var v;
				var length;
				var as = ao;
				var aw;
				var value = ap[key];
				if (value && typeof value === "object"
						&& typeof value.aD === "function") {
					value = value.aD(key);
				}
				if (typeof ay === "function") {
					value = ay.call(ap, key, value);
				}
				switch (typeof value) {
				case "string":
					return J(value);
				case "number":
					return isFinite(value) ? String(value) : "null";
				case "boolean":
				case "null":
					return String(value);
				case "object":
					if (!value) {
						return "null";
					}
					ao += indent;
					aw = [];
					if (Object.prototype.toString.apply(value) === "[object Array]") {
						length = value.length;
						for (i = 0; i < length; i += 1) {
							aw[i] = str(i, value) || "null";
						}
						v = aw.length === 0 ? "[]" : ao ? "[\n" + ao
								+ aw.join(",\n" + ao) + "\n" + as + "]" : "["
								+ aw.join(",") + "]";
						ao = as;
						return v;
					}
					if (ay && typeof ay === "object") {
						length = ay.length;
						for (i = 0; i < length; i += 1) {
							if (typeof ay[i] === "string") {
								k = ay[i];
								v = str(k, value);
								if (v) {
									aw.push(J(k) + (ao ? ": " : ":") + v);
								}
							}
						}
					} else {
						for (k in value) {
							if (Object.prototype.hasOwnProperty.call(value, k)) {
								v = str(k, value);
								if (v) {
									aw.push(J(k) + (ao ? ": " : ":") + v);
								}
							}
						}
					}
					v = aw.length === 0 ? "{}" : ao ? "{\n" + ao
							+ aw.join(",\n" + ao) + "\n" + as + "}" : "{"
							+ aw.join(",") + "}";
					ao = as;
					return v;
				}
			}
			;
			if (typeof JSON.stringify !== "function") {
				meta = {
					"\b" : "\\b",
					"\t" : "\\t",
					"\n" : "\\n",
					"\f" : "\\f",
					"\r" : "\\r",
					"\"" : "\\\"",
					"\\" : "\\\\"
				};
				JSON.stringify = function(value, az, space) {
					var i;
					ao = "";
					indent = "";
					if (typeof space === "number") {
						for (i = 0; i < space; i += 1) {
							indent += " ";
						}
					} else if (typeof space === "string") {
						indent = space;
					}
					ay = az;
					if (az
							&& typeof az !== "function"
							&& (typeof az !== "object" || typeof az.length !== "number")) {
						throw new Error("JSON.stringify");
					}
					return str("", {
						"" : value
					});
				};
			}
			return JSON.stringify;
		}());
var Y = null;
function showLoading(by) {
	if (!Y) {
		Y = document.createElement("img");
		Y.src = "http://print.jatools.com/jcp/0.99/image/loading1.gif";
		Y.style.verticalAlign = "middle";
	}
	Y.style.display = "inline";
	var aB = document.getElementById(by);
	aB.parentNode.insertBefore(Y, aB.nextSibling);
};
function hideLoading() {
	if (Y) {
		Y.style.display = "none";
	}
}