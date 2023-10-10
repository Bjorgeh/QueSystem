#include <QtQml/qqmlprivate.h>
#include <QtCore/qdir.h>
#include <QtCore/qurl.h>
#include <QtCore/qhash.h>
#include <QtCore/qstring.h>

namespace QmlCacheGeneratedCode {
namespace _qt_qml_QueSystem_project_Oct_23_Main_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::TypedFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_QueSystem_project_Oct_23_background_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::TypedFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_QueSystem_project_Oct_23_global_functions_js { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::TypedFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_QueSystem_project_Oct_23_Components_Popups_Left_list_popup_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::TypedFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_QueSystem_project_Oct_23_Components_Popups_Middle_list_popup_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::TypedFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_QueSystem_project_Oct_23_Components_Popups_Right_list_popup_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::TypedFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_QueSystem_project_Oct_23_Components_SwipeView_Left_page_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::TypedFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_QueSystem_project_Oct_23_Components_SwipeView_Middle_page_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::TypedFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_QueSystem_project_Oct_23_Components_SwipeView_Right_page_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::TypedFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}

}
namespace {
struct Registry {
    Registry();
    ~Registry();
    QHash<QString, const QQmlPrivate::CachedQmlUnit*> resourcePathToCachedUnit;
    static const QQmlPrivate::CachedQmlUnit *lookupCachedUnit(const QUrl &url);
};

Q_GLOBAL_STATIC(Registry, unitRegistry)


Registry::Registry() {
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/QueSystem_project_Oct_23/Main.qml"), &QmlCacheGeneratedCode::_qt_qml_QueSystem_project_Oct_23_Main_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/QueSystem_project_Oct_23/background.qml"), &QmlCacheGeneratedCode::_qt_qml_QueSystem_project_Oct_23_background_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/QueSystem_project_Oct_23/global_functions.js"), &QmlCacheGeneratedCode::_qt_qml_QueSystem_project_Oct_23_global_functions_js::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/QueSystem_project_Oct_23/Components/Popups/Left_list_popup.qml"), &QmlCacheGeneratedCode::_qt_qml_QueSystem_project_Oct_23_Components_Popups_Left_list_popup_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/QueSystem_project_Oct_23/Components/Popups/Middle_list_popup.qml"), &QmlCacheGeneratedCode::_qt_qml_QueSystem_project_Oct_23_Components_Popups_Middle_list_popup_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/QueSystem_project_Oct_23/Components/Popups/Right_list_popup.qml"), &QmlCacheGeneratedCode::_qt_qml_QueSystem_project_Oct_23_Components_Popups_Right_list_popup_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/QueSystem_project_Oct_23/Components/SwipeView/Left_page.qml"), &QmlCacheGeneratedCode::_qt_qml_QueSystem_project_Oct_23_Components_SwipeView_Left_page_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/QueSystem_project_Oct_23/Components/SwipeView/Middle_page.qml"), &QmlCacheGeneratedCode::_qt_qml_QueSystem_project_Oct_23_Components_SwipeView_Middle_page_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/QueSystem_project_Oct_23/Components/SwipeView/Right_page.qml"), &QmlCacheGeneratedCode::_qt_qml_QueSystem_project_Oct_23_Components_SwipeView_Right_page_qml::unit);
    QQmlPrivate::RegisterQmlUnitCacheHook registration;
    registration.structVersion = 0;
    registration.lookupCachedQmlUnit = &lookupCachedUnit;
    QQmlPrivate::qmlregister(QQmlPrivate::QmlUnitCacheHookRegistration, &registration);
}

Registry::~Registry() {
    QQmlPrivate::qmlunregister(QQmlPrivate::QmlUnitCacheHookRegistration, quintptr(&lookupCachedUnit));
}

const QQmlPrivate::CachedQmlUnit *Registry::lookupCachedUnit(const QUrl &url) {
    if (url.scheme() != QLatin1String("qrc"))
        return nullptr;
    QString resourcePath = QDir::cleanPath(url.path());
    if (resourcePath.isEmpty())
        return nullptr;
    if (!resourcePath.startsWith(QLatin1Char('/')))
        resourcePath.prepend(QLatin1Char('/'));
    return unitRegistry()->resourcePathToCachedUnit.value(resourcePath, nullptr);
}
}
int QT_MANGLE_NAMESPACE(qInitResources_qmlcache_appQueSystem_project_Oct_23)() {
    ::unitRegistry();
    return 1;
}
Q_CONSTRUCTOR_FUNCTION(QT_MANGLE_NAMESPACE(qInitResources_qmlcache_appQueSystem_project_Oct_23))
int QT_MANGLE_NAMESPACE(qCleanupResources_qmlcache_appQueSystem_project_Oct_23)() {
    return 1;
}
