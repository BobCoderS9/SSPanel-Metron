"use strict";

var KTLayoutHeaderMenu = function() {
    // 私人财产
	var _menuElement;
    var _menuObject;
    var _offcanvasElement;
    var _offcanvasObject;

    // 私人职能
	var _init = function() {
		_offcanvasObject = new KTOffcanvas(_offcanvasElement, {
			overlay: true,
			baseClass: 'header-menu-wrapper',
			closeBy: 'kt_header_menu_mobile_close_btn',
			toggleBy: {
				target: 'kt_header_mobile_toggle',
				state: 'burger-icon-active'
			}
		});

		_menuObject = new KTMenu(_menuElement, {
			submenu: {
				desktop: 'dropdown',
				tablet: 'accordion',
				mobile: 'accordion'
			},
			accordion: {
				slideSpeed: 200, // 手风琴拨动滑动速度（以毫秒为单位）
				expandAll: false // 允许菜单中有多个扩展的手风琴
			}
		});

		// 在平板电脑和移动设备上重新加载页面之前，请先关闭“画布”面板附近
        _menuObject.on('linkClick', function(menu) {
            if (KTUtil.isBreakpointDown('lg')) { // 平板电脑和移动模式
                _offcanvasObject.hide(); // 单击常规链接后隐藏画布
            }
        });
	}

    // 公开方法
	return {
        init: function(menuId, offcanvasId) {
            _menuElement = KTUtil.getById(menuId);
            _offcanvasElement = KTUtil.getById(offcanvasId);

            if (!_menuElement) {
                return;
            }

            // 初始化菜单
            _init();
		},

		getMenuElement: function() {
			return _menuElement;
		},

        getOffcanvasElement: function() {
			return _offcanvasElement;
		},

        getMenu: function() {
			return _menuObject;
		},

		pauseDropdownHover: function(time) {
			if (_menuObject) {
				_menuObject.pauseDropdownHover(time);
			}
		},

        getOffcanvas: function() {
			return _offcanvasObject;
		},

		closeMobileOffcanvas: function() {
			if (_menuObject && KTUtil.isMobileDevice()) {
				_offcanvasObject.hide();
			}
		}
	};
}();

// Webpack支持
if (typeof module !== 'undefined') {
	module.exports = KTLayoutHeaderMenu;
}
