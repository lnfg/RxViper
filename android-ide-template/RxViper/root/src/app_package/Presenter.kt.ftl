package ${packageName}

import com.dzaitsev.rxviper.<#if generateRouter>Viper</#if>Presenter
<#if useInject>

import javax.inject.Inject
</#if>
<#if generateRouter>
class ${name}Presenter<#if useInject>@Inject constructor</#if>(private val ${name?uncap_first}Interactor: ${name}Interactor) : ViperPresenter<${name}ViewCallbacks, ${name}Router>() {
<#else>
class ${name}Presenter<#if useInject>@Inject constructor</#if>(private val ${name?uncap_first}Interactor: ${name}Interactor) : Presenter<${name}ViewCallbacks>() {

  fun do${name}(requestModel: Any) {
    ${name?uncap_first}Interactor.execute({ o ->
      // TODO: Implement onNext here...
    }, { t ->
      // TODO: Implement onError here...
    }, requestModel)
  }

  override fun onDropRouter(router: ${name}Router) {
  }

  override fun onDropView(view: ${name}ViewCallbacks) {
    ${name?uncap_first}Interactor.unsubscribe()
  }
}
