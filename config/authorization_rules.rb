authorization do
  role :guest do
    has_permission_on :users, :to => [:read_index,:create]
    has_permission_on :lemmas, :to => :read
  end
 
  role :fbplayer do
    includes :guest
    has_permission_on :users, :to => [:read_show,:update] do
      if_attribute :id => is {user.id}
    end
      has_permission_on  :coauthors, :to => :create
      has_permission_on  :lemmas, :to => [:create,:add_tags,:remove_tags]
      has_permission_on  :lemmas, :to => :update do
      if_attribute :users => contains {user}
  end
 end
   role :Supplier do
    includes :fbplayer
    has_permission_on :users, :to => :read_show
    has_permission_on :lemmas, :to => :update
  end
 
  role :Sponsor do
    #includes :Supplier
    has_permission_on [:users,:lemmas, :coauthors ], :to => :manage
    has_permission_on :authorization_rules, :to =>  :manage
    has_permission_on :authorization_usages, :to => :manage
  end
end
 
privileges do
  privilege :manage, :includes => [:create, :read, :update, :delete,:add_tags,:remove_tags]
  privilege :read, :includes => [:index, :show, :tag]
  privilege :read_index, :includes => :index
  privilege :read_show, :includes => :show
  privilege :create, :includes => :new
  privilege :add_tags,:includes => :add_tag
  privilege :remove_tags,:includes => :remove_tag
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end

#为了实现授权规则与业务逻辑相分离,declarative authorization指定把所有的授权规则都定义到一个配置文件中,
#并为我们提供专门的DSL来编写授权规则.
#首先,我们得把\vendor \plugins\declarative_authorization目录下的样本authorization_rules.dist.rb复制到 config目录下,
#并更名为authorization_rules.rb.打开authorization_rules.rb,去掉注释

#整个代码分为两大块,授权块与特权块.

#先看特权块,已给定了五个特权,四个简单的特权(:read,:update,:create,:delete)和一个复合特权 (:manage).
#include 后面的就是controller的action的名字.看下图,在rails的应用中,我们要对某个资源进行操作,必須经过action.
#而对于某些 action,它是以另一个action为前提.如update action,必然先经过edit action,通过edit action渲染出视图,再有edit.html上的表单提交到到达update action.
#因此,那四个简单特权就构建index、show、edit、update和destroy这五个restful风格的action的访问控制上就行.如果不满意的话,也可以自定义action,再对其进行访问控制.

#再看授权块,它是用来分配权限.注意,是权限（Permission）,不是特权(Privilege).就在我们刚说完的特权块中,
#那些特权都是光指对某些资源的控制器的action进行访问控制,但并没有指定具体的资源类别,这里我们就要把这些特权转化为权限了.
#既然说是权限,那么“限”谁呢？嗯,不难看出,是限制到某个角色,限制到某种资源,只有特定角色才能对特定资源进行特定操作,而且还要满足一定的要求
#（如控制器中开启属性检查.具体的检查方法就是在这里定义的）.一个流行公式是这样的:权限 =  资源 + 操作。这里得变通一下,操作都封装在特权里,
#一个特权可能拥有N个操作,而且还有属性检举查这样条件,因此 权限 = 资源 * 特权 if 条件.而一个角色或许能对多种资源进行操作,因此,从某种意义上讲,
#角色就是一定数量的权限的集合.了解完这些,让我们编写些授权规则吧.在默认情况下,已经为我们分配了一个guest角色.它将在请求和任何用户都没有关联或当一个用户没有任何角色时被调用.
#因此,如果我们的应用程序有一些公共页面,可以用guest来让那些没有登录的用户实现访问.现在我们的应用还很小很小,只有两个资源(User与 Session).为了让用户自由登录,我们不应该在Session中设置授权控制.
#User资源,我们打算让index可以让任何人访问,show与 edit只有该用户才能访问到——这当然要求登录成为wikier,要求基本不能进行属性检查以判断其是否同一个人！