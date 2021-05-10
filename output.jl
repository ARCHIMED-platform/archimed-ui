using Blink, WebSockets, WebIO, Interact, Observables, CSSUtil, Markdown, ImageShow, Colors, AssetRegistry , OrderedCollections, YAML

#Generate a unique url key for assets

# Chemin relatif A vérifier avec Rémi
filepath_icon = joinpath(@__DIR__, "icon.png")
println(filepath_icon)

icon_key = AssetRegistry.register("E:/Stage_julia/ExemplAppli/Archimed_Application/archimed-ui/assets/icon.png")
icon2_key = AssetRegistry.register("E:/Stage_julia/ExemplAppli/Archimed_Application/archimed-ui/assets/icon2.png")

coffee_key= AssetRegistry.register("E:/Stage_julia/ExemplAppli/Archimed_Application/archimed-ui/assets/coffee.png")#coffee_animation.gif
tree_key= AssetRegistry.register("E:/Stage_julia/ExemplAppli/Archimed_Application/archimed-ui/assets/tree.png")#tree.gif
palm_key= AssetRegistry.register("E:/Stage_julia/ExemplAppli/Archimed_Application/archimed-ui/assets/palm3.png")
logo1_key= AssetRegistry.register("E:/Stage_julia/ExemplAppli/Archimed_Application/archimed-ui/assets/amap.png")
amaplab_key= AssetRegistry.register("E:/Stage_julia/ExemplAppli/Archimed_Application/archimed-ui/assets/amaplab.png")
logo2_key= AssetRegistry.register("E:/Stage_julia/ExemplAppli/Archimed_Application/archimed-ui/assets/logo2.png")
logo3_key= AssetRegistry.register("E:/Stage_julia/ExemplAppli/Archimed_Application/archimed-ui/assets/logo.png")

##########################Tbbed menu###########################

#Buttons as an ordred Dict


b1=dom"button"("Configuration",style=Dict(:borderRadius=> "10px",:padding=>"5px",:background=>"rgba(122, 199, 199, 0.62)",:color=>"black",:fontWeight=>"weight",:border=>"solid 0.7px", :width => "130px",
   :height => "50px"))
   
b2=dom"button"("Simulation",style=Dict(:borderRadius=> "10px",:padding=>"5px",:background=>"rgba(196, 196, 196, 0.62)",:color=>"black",:fontWeight=>"weight",:border=>"solid 0.7px", :width => "130px",
   :height => "50px"))

b3=dom"button"("output",style=Dict(:borderRadius=> "10px",:padding=>"5px",:background=>"rgba(196, 196, 196, 0.62)",:color=>"black",:fontWeight=>"weight",:border=>"solid 0.7px",:width => "130px",
   :height => "50px"))
   
b4=dom"button"("Input",style=Dict(:borderRadius=> "10px",:padding=>"5px",:background=>"rgba(196, 196, 196, 0.62)",:color=>"black",:fontWeight=>"weight",:border=>"solid 1px ",:width => "60px",
   :height => "50px"))
   
b5=dom"button"("Output",style=Dict(:borderRadius=> "10px",:padding=>"5px",:background=>"rgba(122, 199, 199, 0.62)",:color=>"black",:fontWeight=>"weight",:border=>"solid 1px ",:width => "60px",
   :height => "50px"))
   
b6=dom"button"("Output directory Settings",style=Dict(:borderRadius=> "10px",:padding=>"5px",:background=>"rgba(122, 199, 199, 0.62)",:color=>"black",:fontWeight=>"weight",:border=>"solid 0.7px",:width => "150px",
   :height => "50px"))
   
b7=dom"button"("Component variables",style=Dict(:borderRadius=> "10px",:padding=>"5px",:background=>"rgba(196, 196, 196, 0.62)",:color=>"black",:font=>"weight",:border=>"solid 0.7px",:width => "150px",
   :height => "50px"))
  
b8=dom"button"("Settings",style=Dict(:borderRadius=> "10px",:padding=>"5px",:background=>"rgba(196, 196, 196, 0.62)",:color=>"black",:font=>"weight",:border=>"solid 0.7px",:width => "110px",
   :height => "50px"))

b9=dom"button"("Intercepted light",style=Dict(:borderRadius=> "10px",:padding=>"5px",:background=>"rgba(196, 196, 196, 0.62)",:color=>"black",:font=>"weight",:border=>"solid 0.7px",:width => "130px",
   :height => "50px"))

b10=dom"button"("Absorbed light",style=Dict(:borderRadius=> "10px",:padding=>"5px",:background=>"rgba(196, 196, 196, 0.62)",:color=>"black",:font=>"weight",:border=>"solid 0.7px",:width => "130px",
   :height => "50px"))

b11=dom"button"("Assimilation",style=Dict(:borderRadius=> "10px",:padding=>"5px",:background=>"rgba(196, 196, 196, 0.62)",:color=>"black",:font=>"weight",:border=>"solid 0.7px",:width => "100px",
   :height => "50px"))

b12=dom"button"("Energy",style=Dict(:borderRadius=> "10px",:padding=>"5px",:background=>"rgba(196, 196, 196, 0.62)",:color=>"black",:font=>"weight",:border=>"solid 0.7px",:width => "100px",
   :height => "50px"))

save=dom"button"("Save changes",style=Dict(:borderRadius=> "10px",:padding=>"5px",:background=>"rgba(122, 199, 199, 0.62)",:color=>"black",:font=>"bold",:border=>" solid 0.5px ",:width => "100px",
:height => "30px"))
w=Window()
body!(w,save)

# Buttons ordered as a navigation menu

tab_out=vbox(hbox(b1,b2,b3),hbox(hskip(10px),b4,b5),hbox(hskip(20px),b6,b7), hbox(hskip(30px),b8,b9,b10,b11,b12))


 ######Create a node with a div for the information's icon and for the images: coffe, growing tree, palm and logos  ##########

 icon_key
 icon= Node(
         #hskip(100em),
         :div,
         dom"img"(src= "/assetserver/481517802c012771324d333bd380a65f9f4f17d5-icon.png") #"/assetserver/f45aa1725c3438fe4969c23f5465c8527a087316-icon.png")
 )   
 
 icon2_key
 icon2= Node(
         #hskip(100em),
         :div,
         dom"img"(src= "/assetserver/7a74953d7ebd73fcb261fefb1ea98385d5a9427a-icon2.png") #"/assetserver/f45aa1725c3438fe4969c23f5465c8527a087316-icon.png")
 ) 
 
 
 
 coffee_key
 img_coffee=Node(
         :div,
         dom"img"(src="/assetserver/2ac08712dd495dd9f6788d048f12ec4c879a9b83-coffee.png") #"/assetserver/394b3aa09cf127c8fde965481baf6db59d63580e-coffee_animation.gif")
 )
 
 tree_key
 img_tree=Node(
         :div,
         dom"img"(src="/assetserver/a956b7fc07748699715f01f6a457f9c394e8c08f-tree.png") #"/assetserver/1a4ea4ea662b062ab1e4488fde325d46448830de-tree.gif")
        
 )
 
 palm_key
 img_palm=Node(
         :div,
         dom"img"(src= "/assetserver/5ad3fe23cd721e7c915f6efdd7653a1856c54019-palm3.png")#"/assetserver/0a3e740be9e89bb5f53888c5278eb708eedaa040-palm1.png")
 )
 
 logo1_key
 logo1=Node(
         :div,
         dom"img"(src= "/assetserver/6b005aa2f270f5576a9e5f8a50e0dc4cfac2b273-amap.png") #"/assetserver/b7d3c7db9554b821703d9724547ddd562ef41ed3-amap.png")
 )
 
 logoamap=Node(
     :div,
     dom"img"(src= "/assetserver/ad4ad20323f2e9dd49cad0d0506de278ecdbf4f9-amaplab.png") #"/assetserver/b7d3c7db9554b821703d9724547ddd562ef41ed3-amap.png")
 )
 
 amaplab= Node(
     :div,
     dom"img"(src="/assetserver/ad4ad20323f2e9dd49cad0d0506de278ecdbf4f9-amaplab.png") #"/assetserver/b7d3c7db9554b821703d9724547ddd562ef41ed3-amap.png")
 )
 
 
 logo2_key
 logo2=Node(
         :div,
         dom"img"(src="/assetserver/7bea73482bd13e8412f00290b85fdd6d26ebfc71-logo2.png") #"/assetserver/ef8df61f8260f8b6c5f1b1b609404bfd06c17947-logo2.png")
 )
 
 
 logo3_key
 logo3=Node(
         :div,
         dom"img"(src="/assetserver/a1e2ae231714c8313e3c23a87385443e0b95f62f-logo.png") #"/assetserver/ef8df61f8260f8b6c5f1b1b609404bfd06c17947-logo2.png")
 )
 
 ################################## Create a div with all the images################################
 
 images_out=vbox(
         #vskip(50px),
         hbox(hskip(10px),img_palm),vskip(30px), hbox(hskip(13px),img_tree),vskip(30px),hbox(hskip(18px),img_coffee),#,vskip(100px), #logo_amap
         vskip(30px),
         hbox(hskip(10px),img_palm),vskip(30px), hbox(hskip(13px),img_tree),vskip(30px),hbox(hskip(18px),img_coffee),
         vskip(30px),
         hbox(hskip(10px),img_palm),vskip(30px), hbox(hskip(13px),img_tree),vskip(30px),hbox(hskip(18px),img_coffee),
         vskip(30px),
         hbox(hskip(35px),logo1)
         )
 
 w=Window()
 body!(w, images_out)
 

 # A vérifier avec un autre config
config_from_package= [true, ""]
model = YAML.load_file(file; dicttype=OrderedDict{String,Any})
config_file=filepicker(label="Choose the config file", style=Dict(:color=>"black"); multiple=false, accept=".yml")

#config=read.yml() return Dict type=OrderDict   #lire fichier dans dict change valeur ecrire duirectelent dans dict


hfp = on(config_file) do valfp
    
  model = YAML.load_file(valfp; dicttype=OrderedDict{String,Any})
  config_from_package[1]= false
  config_from_package[2]= valfp # path to user config file
end 



#if else pour écrire les changements si choix du config

# make observable on buttons save and save as 
# make observable onclic save changes 
# on (save changes) do tmp
hcp = on(config_file) do valcp
  if !config_from_package[1]  
      YAML.write_file(config_from_package[2], model)
  else
      alert("Choose the config file or use save as...")
  end

end

#save as or save buttons 

#YAML.write_file("test-output.yml", data)

 ##########################Left-side, Parameters 1= param1_out checkboxex###########################
 
 # Title Settings section
 
 output_settings= Node(
         :div,
         node(:label,"Output Settings", style=Dict(:padding=>"20px", :color=>"black",:backgroundColor => "rgba(212, 151, 133, 1)",:border=>"solid 1px rgba(212, 151, 133, 1)", :height=>"100px", :width=>"200px")
       
       ),
 )


# Create checkboxes

# 1) Step Number 


 stepnumber= Node(
         :div,
         node(:label,"Step number", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
       
       ),
 )

#Checkbox
 
 stepnum = checkbox(style=Dict(:border=>"solid 1px black"))
 
 #Make observable on "step number"
 
 hst = on(stepnum) do valst
         #println("Got an update: ", val) # changer la valeur dans le dict
         model["step_number"]=valst
 end 
 
 
 
 check_stepnum=Node(
         :div,
         stepnum,#checkbox(style=Dict(:border=>"solid 1px black")),
       )
     
 
 step_number= hbox(stepnumber,hskip(10px),check_stepnum)
 
 
# 2) Step Duration

stepduration= Node(
         :div,
         node(:label,"Step duration", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
       
       ),
 )

#Checkbox
 
 stepdur = checkbox(style=Dict(:border=>"solid 1px black"))
 
 #Make observable on "step duration"
 
 hdr = on(stepdur) do valdr
         #println("Got an update: ", val) # changer la valeur dans le dict
         model["step_duration"]=valdr
 end 
 
 
 
 check_stepdur=Node(
         :div,
         stepdur#checkbox(style=Dict(:border=>"solid 1px black")),
       )
     
 
 step_duration= hbox(stepduration,hskip(10px),check_stepdur)

 # 3) Item_id
itemid= Node(
    :div,
    node(:label,"Item id", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
  
  ),
)

#Checkbox

item = checkbox(style=Dict(:border=>"solid 1px black"))

#Make observable on "item id"

hit = on(item) do valit
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["item_id"]=valit
end 

check_itemid=Node(
    :div,
    item#checkbox(style=Dict(:border=>"solid 1px black")),
  )

item_id= hbox(itemid,hskip(10px),check_itemid)


# 4) Step Duration

componentid= Node(
         :div,
         node(:label,"Component id", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
       
       ),
 )

#Checkbox
 
 compid = checkbox(style=Dict(:border=>"solid 1px black"))
 
 #Make observable on "component id"
 
 hmi = on(compid) do valmi
         #println("Got an update: ", val) # changer la valeur dans le dict
         model["step_duration"]=valmi
 end 
 
 
 
 check_compid=Node(
         :div,
         compid#checkbox(style=Dict(:border=>"solid 1px black")),
       )
     
 
 component_id= hbox(componentid,hskip(10px),check_compid)


 # 5) Group

group_label= Node(
    :div,
    node(:label,"Group", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
  
  ),
)

#Checkbox

grp = checkbox(style=Dict(:border=>"solid 1px black"))

#Make observable on "group"

hg = on(grp) do valg
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["group"]=valg
end 



check_group=Node(
    :div,
    grp#checkbox(style=Dict(:border=>"solid 1px black")),
  )


group= hbox(group_label,hskip(10px),check_group)


# 6) Type

type_label= Node(
         :div,
         node(:label,"Type", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
       
       ),
 )

#Checkbox
 
typ = checkbox(style=Dict(:border=>"solid 1px black"))
 
 #Make observable on "type"
 
 hty = on(typ) do valty
         #println("Got an update: ", val) # changer la valeur dans le dict
         model["type"]=valty
 end 
 
 
 
 check_type=Node(
         :div,
         typ#checkbox(style=Dict(:border=>"solid 1px black")),
       )
     
 
 type= hbox(type_label,hskip(10px),check_type)

 
  # 7) Area

area_label= Node(
  :div,
  node(:label,"Area", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),

),
)

#Checkbox

are = checkbox(style=Dict(:border=>"solid 1px black"))

#Make observable on "area"

har = on(are) do valar
  #println("Got an update: ", val) # changer la valeur dans le dict
  model["area"]=valar
end 

check_area=Node(
  :div,
  are#checkbox(style=Dict(:border=>"solid 1px black")),
)


area= hbox(area_label,hskip(10px),check_area)



 # Join all checkbox parameters in param1_out

param1_out = vbox(
vskip(20px),
hbox(hskip(10px),output_settings),
vskip(50px),
hbox(hskip(80px),
vbox(
hbox(icon2,hskip(5px),step_number),
vskip(30px),
hbox(icon2,hskip(5px),step_duration),
vskip(30px),
hbox(icon2,hskip(5px),item_id),
vskip(30px),
hbox(icon2,hskip(5px),component_id),
vskip(30px),
hbox(icon2, hskip(5px),group),
vskip(30px),
hbox(icon2, hskip(5px),area)))
    
)


# Show param1_out

w=Window()

body!(w,param1_out)


##########################Right-side, Parameters 2=param2_out ###########################

# 8) Surface hits

surfhit_label= Node(
    :div,
    node(:label,"Surface hits", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
  
  ),
)

#Checkbox

surfhit = checkbox(style=Dict(:border=>"solid 1px black"))

#Make observable on "surface hits"

hsh= on(surfhit) do valsh
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["surface_hits"]=valsh
end 


check_surfhit=Node(
    :div,
    surfhit#checkbox(style=Dict(:border=>"solid 1px black")),
  )


surface_hit= hbox(surfhit_label,hskip(10px),check_surfhit)


# 9) Barycenter x

baryx_label= Node(
    :div,
    node(:label,"Barycenter X", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
  
  ),
)

#Checkbox

baryx = checkbox(style=Dict(:border=>"solid 1px black"))

#Make observable on "barycenter x"

hbx = on(baryx) do valbx
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["barycenter_x"]=valbx
end 



check_baryx=Node(
    :div,
    baryx#checkbox(style=Dict(:border=>"solid 1px black")),
  )


barycenter_x= hbox(baryx_label,hskip(10px),check_baryx)


# 10) Barycenter y

bary_label= Node(
    :div,
    node(:label,"Barycenter Y", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
  
  ),
)

#Checkbox

bary = checkbox(style=Dict(:border=>"solid 1px black"))

#Make observable on "barycenter y"

hby = on(bary) do valby
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["barycenter_y"]=valby
end 



check_bary=Node(
    :div,
    bary#checkbox(style=Dict(:border=>"solid 1px black")),
  )


barycenter_y= hbox(bary_label,hskip(10px),check_bary)



# 11) Barycenter z

baryz_label= Node(
    :div,
    node(:label,"Barycenter Z", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
  
  ),
)

#Checkbox

baryz = checkbox(style=Dict(:border=>"solid 1px black"))

#Make observable on "barycenter z"

hbz = on(baryz) do valbz
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["barycenter_z"]=valbz
end 



check_baryz=Node(
    :div,
    baryz#checkbox(style=Dict(:border=>"solid 1px black")),
  )


barycenter_z= hbox(baryz_label,hskip(10px),check_baryz)


# 12) Sky fraction

skyfrac_label= Node(
    :div,
    node(:label,"Sky fraction", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
  
  ),
)

#Checkbox

skyfrac = checkbox(style=Dict(:border=>"solid 1px black"))

#Make observable on "sky fraction"

hsf = on(skyfrac) do valsf
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["sky_fraction"]=valsf
end 



check_skyfrac=Node(
    :div,
    skyfrac#checkbox(style=Dict(:border=>"solid 1px black")),
  )


sky_fraction= hbox(skyfrac_label,hskip(10px),check_skyfrac)

# 13) OPF Overrwite variables



# Join all checkbox parameters in param2_out

param2_out = vbox(
    vskip(20px),
    #hbox(icon,hskip(5px),area),
    #vskip(30px),
    hbox(icon,surface_hit),
    vskip(30px),
    hbox(icon,barycenter_x),
    vskip(30px),
    hbox(icon,hskip(5px),barycenter_y),
    vskip(30px),
    hbox(icon,barycenter_z),
    vskip(30px),
    hbox(icon,hskip(5px),sky_fraction),
    
    )


# Show param2_out

w=Window()

body!(w,param2_out)

# create a div to push down param2_out

divparam2_out= Node(
:div,

style=Dict(
:backgroundColor => "rgba(241, 247, 213, 0.25)",#rgba(241, 247, 213, 0.39)
#:padding=>"70px"
#:border=>"solid"

),

)

# Put the div on top of checkbottons (parameter 2_out)

param2bis_out=vbox(divparam2_out,vskip(80px), 
param2_out)

# create a div between param1_out and param2_out

param1bis_out= hbox(param1_out,hskip(200px),divparam2_out)

# Merge param1_out with param2_out

param_12_out=hbox(hskip(30px),param1bis_out,param2bis_out)#_1

# Show param2_out

w=Window()

body!(w,param_12_out)



########################## Left-side,Parameters 3= param3_out###########################

# Title Inetrcepted light section
 
intercepted_light_label= Node(
  :div,
  node(:label,"Intercepted light", style=Dict(:padding=>"20px", :color=>"black",:backgroundColor => "rgba(212, 151, 133, 1)",:border=>"solid 1px rgba(212, 151, 133, 1)", :height=>"100px", :width=>"200px")

),
)

# Title First order interception

f_o_interception_label= Node(
  :div,
  node(:label,"First order interception", style=Dict(:padding=>"20px", :color=>"black",:backgroundColor => "rgba(233, 188, 158, 1)",:border=>"solid 1px rgba(233, 188, 158, 1)", :height=>"100px", :width=>"200px")

),
)

# 1) PAR

par_label= Node(
    :div,
    node(:label,"PAR", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
  
  ),
)

#Checkbox

parflux = checkbox(label="Flux",style=Dict(:border=>"solid 1px black"))
parquant = checkbox(label="Quantity",style=Dict(:border=>"solid 1px black"))

#Make observable on "surface hits"

hpf= on(parflux) do valpf
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["Ri_PAR_0_f"]=valpf
end 

hpq= on(parquant) do valpq
  #println("Got an update: ", val) # changer la valeur dans le dict
  model["Ri_PAR_0_q"]=valpq
end 


check_parflux=Node(
    :div,
    parflux#checkbox(style=Dict(:border=>"solid 1px black")),
  )

check_parquant=Node(
    :div,
    parquant#checkbox(style=Dict(:border=>"solid 1px black")),
  )


par= hbox(par_label,hskip(10px),check_parflux, hskip(20px),check_parquant)


# 2) NIR

nir_label= Node(
    :div,
    node(:label,"NIR", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
  
  ),
)

#Checkbox

nirflux = checkbox(label="Flux", style=Dict(:border=>"solid 1px black"))
nirquant = checkbox(label="Quantity",style=Dict(:border=>"solid 1px black"))

#Make observable on "surface hits"

hnf= on(nirflux) do valnf
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["Ri_NIR_0_f"]=valnf
end 


hnq= on(nirquant) do valnq
  #println("Got an update: ", val) # changer la valeur dans le dict
  model["Ri_NIR_0_q"]=valnq
end 


check_nirflux=Node(
    :div,
    nirflux#checkbox(style=Dict(:border=>"solid 1px black")),
  )

  check_nirquant=Node(
    :div,
    nirquant#checkbox(style=Dict(:border=>"solid 1px black")),
  )

nir= hbox(nir_label,hskip(10px),check_nirflux, hskip(20px),check_nirquant)


# Join all checkbox parameters in param3_out

param3_out = vbox(
vskip(20px),
hbox(hskip(10px),intercepted_light_label),
vskip(70px),
hbox(hskip(50px),f_o_interception_label),
vskip(70px),
hbox(hskip(80px),
vbox(
hbox(icon2,hskip(5px),par),
vskip(60px),
hbox(icon2,hskip(5px),nir)))
    
)


########################## Right-side,Parameters 4= param4_out ###########################

# section: interception with scattering

scatt_interception_label= Node(
  :div,
  node(:label,"Interception with scattering", style=Dict(:padding=>"20px", :color=>"black",:backgroundColor => "rgba(233, 188, 158, 1)",:border=>"solid 1px rgba(233, 188, 158, 1)", :height=>"100px", :width=>"200px")

),
)

# 1) PAR

int_scatt_par_label= Node(
    :div,
    node(:label,"PAR", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
  
  ),
)

#Checkbox

int_scatt_parflux = checkbox(label="Flux",style=Dict(:border=>"solid 1px black"))
int_scatt_parquant = checkbox(label="Quantity",style=Dict(:border=>"solid 1px black"))

#Make observable on "surface hits"

hspf= on(int_scatt_parflux) do valspf
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["Ri_PAR_f"]=valspf
end 

hspq= on(int_scatt_parquant) do valspq
  #println("Got an update: ", val) # changer la valeur dans le dict
  model["Ri_PAR_q"]=valspq
end 

check_int_scatt_parflux=Node(
    :div,
    int_scatt_parflux#checkbox(style=Dict(:border=>"solid 1px black")),
  )

  check_int_scatt_parquant=Node(
    :div,
    int_scatt_parquant#checkbox(style=Dict(:border=>"solid 1px black")),
  )


  int_scatt_par= hbox(int_scatt_par_label,hskip(10px),check_int_scatt_parflux, hskip(20px),check_int_scatt_parquant)


# 2) NIR

int_scatt_nir_label= Node(
    :div,
    node(:label,"NIR", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
  
  ),
)

#Checkbox

int_scatt_nirflux = checkbox(label="Flux", style=Dict(:border=>"solid 1px black"))
int_scatt_nirquant = checkbox(label="Quantity",style=Dict(:border=>"solid 1px black"))

#Make observable on "surface hits"

hsnf= on(int_scatt_nirflux) do valsnf
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["Ri_NIR_f"]=valsnf
end 

hsnq= on(int_scatt_nirquant) do valsnq
  #println("Got an update: ", val) # changer la valeur dans le dict
  model["Ri_NIR_q"]=valsnq
end 


check_int_scatt_nirflux=Node(
    :div,
    int_scatt_nirflux#checkbox(style=Dict(:border=>"solid 1px black")),
  )

  check_int_scatt_nirquant=Node(
    :div,
    int_scatt_nirquant#checkbox(style=Dict(:border=>"solid 1px black")),
  )

  int_scatt_nir= hbox(int_scatt_nir_label,hskip(10px),check_int_scatt_nirflux, hskip(20px),check_int_scatt_nirquant)

# 3) TIR

int_scatt_tir_label= Node(
    :div,
    node(:label,"TIR", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
  
  ),
)

#Checkbox

int_scatt_tirflux = checkbox(label="Flux", style=Dict(:border=>"solid 1px black"))
int_scatt_tirquant = checkbox(label="Quantity",style=Dict(:border=>"solid 1px black"))

#Make observable on "surface hits"

hstf= on(int_scatt_tirflux) do valstf
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["Ri_TIR_f"]=valstf
end 

hstq= on(int_scatt_tirquant) do valstq
  #println("Got an update: ", val) # changer la valeur dans le dict
  model["Ri_TIR_q"]=valstq
end 


check_int_scatt_tirflux=Node(
    :div,
    int_scatt_tirflux#checkbox(style=Dict(:border=>"solid 1px black")),
  )

  check_int_scatt_tirquant=Node(
    :div,
    int_scatt_tirquant#checkbox(style=Dict(:border=>"solid 1px black")),
  )

  int_scatt_tir= hbox(int_scatt_tir_label,hskip(10px),check_int_scatt_tirflux, hskip(20px),check_int_scatt_tirquant)





# Join all checkbox parameters in param4_out

param4_out = vbox(
vskip(55px),
hbox(hskip(50px),scatt_interception_label),
vskip(70px),
hbox(hskip(50px),
vbox(
hbox(icon,#hskip(5px),
int_scatt_par),
vskip(30px),
hbox(icon,#hskip(5px),
int_scatt_nir),
vskip(30px),
hbox(icon,#hskip(5px),
int_scatt_tir)))
    
)

# create a div between param1_out and param2_out

param3bis_out= hbox(param3_out,hskip(50px),divparam2_out)


# Put the div on top of checkbottons (parameter 4 "param4_out")

param4bis_out=vbox(divparam2_out,vskip(60px), 
param4_out)

# Merge param1_out with param2_out

param_34_out=hbox(hskip(30px),param3bis_out,param4bis_out)


########################## Left-side,Parameters 5= param5_out###########################

# Title Absorbed light section
 
absorbed_light_label= Node(
  :div,
  node(:label,"Absorbed light", style=Dict(:padding=>"20px", :color=>"black",:backgroundColor => "rgba(212, 151, 133, 1)",:border=>"solid 1px rgba(212, 151, 133, 1)", :height=>"100px", :width=>"200px")

),
)

# Title First order interception

ab_f_o_interception_label= Node(
  :div,
  node(:label,"First order interception", style=Dict(:padding=>"20px", :color=>"black",:backgroundColor => "rgba(233, 188, 158, 1)",:border=>"solid 1px rgba(233, 188, 158, 1)", :height=>"100px", :width=>"200px")

),
)

# 1) PAR

ab_par_label= Node(
    :div,
    node(:label,"PAR", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
  
  ),
)

#Checkbox

ab_parflux = checkbox(label="Flux",style=Dict(:border=>"solid 1px black"))
ab_parquant = checkbox(label="Quantity",style=Dict(:border=>"solid 1px black"))

#Make observable on "surface hits"

hpfa= on(ab_parflux) do valpfa
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["Ra_PAR_0_f"]=valpfa
end 

hpqa= on(ab_parquant) do valpqa
  #println("Got an update: ", val) # changer la valeur dans le dict
  model["Ra_PAR_0_q"]=valpqa
end 


check_abparflux=Node(
    :div,
    ab_parflux#checkbox(style=Dict(:border=>"solid 1px black")),
  )

check_abparquant=Node(
    :div,
    ab_parquant#checkbox(style=Dict(:border=>"solid 1px black")),
  )


ab_par= hbox(par_label,hskip(10px),check_abparflux, hskip(20px),check_abparquant)


# 2) NIR

nir_label= Node(
    :div,
    node(:label,"NIR", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
  
  ),
)

#Checkbox

ab_nirflux = checkbox(label="Flux", style=Dict(:border=>"solid 1px black"))
ab_nirquant = checkbox(label="Quantity",style=Dict(:border=>"solid 1px black"))

#Make observable on "surface hits"

hnfa= on(ab_nirflux) do valnfa
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["Ra_NIR_0_f"]=valnfa
end 


hnqa= on(ab_nirquant) do valnqa
  #println("Got an update: ", val) # changer la valeur dans le dict
  model["Ra_NIR_0_q"]=valnqa
end 


check_abnirflux=Node(
    :div,
    ab_nirflux#checkbox(style=Dict(:border=>"solid 1px black")),
  )

  check_abnirquant=Node(
    :div,
    ab_nirquant#checkbox(style=Dict(:border=>"solid 1px black")),
  )

ab_nir= hbox(nir_label,hskip(10px),check_abnirflux, hskip(20px),check_abnirquant)


# Join all checkbox parameters in param5_out

param5_out = vbox(
vskip(20px),
hbox(hskip(10px),absorbed_light_label),
vskip(70px),
hbox(hskip(50px),ab_f_o_interception_label),
vskip(70px),
hbox(hskip(80px),
vbox(
hbox(icon2,hskip(5px),ab_par),
vskip(60px),
hbox(icon2,hskip(5px),ab_nir)))
    
)


########################## Right-side,Parameters 6= param6_out ###########################

# Title interception with scattering

ab_scatt_interception_label= Node(
  :div,
  node(:label,"Interception with scattering", style=Dict(:padding=>"20px", :color=>"black",:backgroundColor => "rgba(233, 188, 158, 1)",:border=>"solid 1px rgba(233, 188, 158, 1)", :height=>"100px", :width=>"200px")

),
)

# 1) PAR

int_scatt_par_label= Node(
    :div,
    node(:label,"PAR", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
  
  ),
)

#Checkbox

ab_int_scatt_parflux = checkbox(label="Flux",style=Dict(:border=>"solid 1px black"))
ab_int_scatt_parquant = checkbox(label="Quantity",style=Dict(:border=>"solid 1px black"))

#Make observable on "surface hits"

hspfa= on(ab_int_scatt_parflux) do valspfa
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["Ra_PAR_f"]=valspfa
end 

hspqa= on(ab_int_scatt_parquant) do valspqa
  #println("Got an update: ", val) # changer la valeur dans le dict
  model["Ra_PAR_q"]=valspqa
end 

check_ab_int_scatt_parflux=Node(
    :div,
    ab_int_scatt_parflux#checkbox(style=Dict(:border=>"solid 1px black")),
  )

  check_ab_int_scatt_parquant=Node(
    :div,
    ab_int_scatt_parquant#checkbox(style=Dict(:border=>"solid 1px black")),
  )


  ab_int_scatt_par= hbox(int_scatt_par_label,hskip(10px),check_ab_int_scatt_parflux, hskip(20px),check_ab_int_scatt_parquant)


# 2) NIR

int_scatt_nir_label= Node(
    :div,
    node(:label,"NIR", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
  
  ),
)

#Checkbox

ab_int_scatt_nirflux = checkbox(label="Flux", style=Dict(:border=>"solid 1px black"))
ab_int_scatt_nirquant = checkbox(label="Quantity",style=Dict(:border=>"solid 1px black"))

#Make observable on "surface hits"

hsnfa= on(ab_int_scatt_nirflux) do valsnfa
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["Ra_NIR_f"]=valsnfa
end 

hsnqa= on(ab_int_scatt_nirquant) do valsnqa
  #println("Got an update: ", val) # changer la valeur dans le dict
  model["Ra_NIR_q"]=valsnqa
end 


check_ab_int_scatt_nirflux=Node(
    :div,
    ab_int_scatt_nirflux#checkbox(style=Dict(:border=>"solid 1px black")),
  )

  check_ab_int_scatt_nirquant=Node(
    :div,
    ab_int_scatt_nirquant#checkbox(style=Dict(:border=>"solid 1px black")),
  )

  ab_int_scatt_nir= hbox(int_scatt_nir_label,hskip(10px),check_ab_int_scatt_nirflux, hskip(20px),check_ab_int_scatt_nirquant)

# 3) TIR

int_scatt_tir_label= Node(
    :div,
    node(:label,"TIR", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
  
  ),
)

#Checkbox

ab_int_scatt_tirflux = checkbox(label="Flux", style=Dict(:border=>"solid 1px black"))
ab_int_scatt_tirquant = checkbox(label="Quantity",style=Dict(:border=>"solid 1px black"))

#Make observable on "surface hits"

hstfa= on(ab_int_scatt_tirflux) do valstfa
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["Ra_TIR_f"]=valstfa
end 

hstqa= on(ab_int_scatt_tirquant) do valstqa
  #println("Got an update: ", val) # changer la valeur dans le dict
  model["Ra_TIR_q"]=valstqa
end 


check_ab_int_scatt_tirflux=Node(
    :div,
    ab_int_scatt_tirflux#checkbox(style=Dict(:border=>"solid 1px black")),
  )

  check_ab_int_scatt_tirquant=Node(
    :div,
    ab_int_scatt_tirquant#checkbox(style=Dict(:border=>"solid 1px black")),
  )

  ab_int_scatt_tir= hbox(int_scatt_tir_label,hskip(10px),check_ab_int_scatt_tirflux, hskip(20px),check_ab_int_scatt_tirquant)





# Join all checkbox parameters in param6_out

param6_out = vbox(
vskip(55px),
hbox(hskip(50px),ab_scatt_interception_label),
vskip(70px),
hbox(hskip(50px),
vbox(
hbox(icon,#hskip(5px),
ab_int_scatt_par),
vskip(30px),
hbox(icon,#hskip(5px),
ab_int_scatt_nir),
vskip(30px),
hbox(icon,#hskip(5px),
ab_int_scatt_tir)))
    
)

# create a div between param5_out and param6_out

param5bis_out= hbox(param5_out,hskip(50px),divparam2_out)


# Put the div on top of checkbottons (parameter 6 "param6_out")

param6bis_out=vbox(divparam2_out,vskip(60px), 
param6_out)

# Merge param5_out with param6_out

param_56_out=hbox(hskip(30px),param5bis_out,param6bis_out)



########################## Left-side,Parameters 7= param7_out###########################

# section: Assimilation 
 
assimilation_label= Node(
  :div,
  node(:label,"Assimilation", style=Dict(:padding=>"20px", :color=>"black",:backgroundColor => "rgba(212, 151, 133, 1)",:border=>"solid 1px rgba(212, 151, 133, 1)", :height=>"100px", :width=>"200px")

),
)


# 1) CO2 assimilation rate

co2_assimilation_rate_label= Node(
    :div,
    node(:label,"CO2 Assimilation rate", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
  
  ),
)

#Checkbox

co2_assimilation_rate_flux = checkbox(label="Flux",style=Dict(:border=>"solid 1px black"))
co2_assimilation_rate_quant = checkbox(label="Quantity",style=Dict(:border=>"solid 1px black"))

#Make observable on "surface hits"

haf= on(co2_assimilation_rate_flux) do valaf
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["An_f"]=valaf
end 

haq= on(co2_assimilation_rate_quant) do valaq
  #println("Got an update: ", val) # changer la valeur dans le dict
  model["An_q"]=valaq
end 


check_co2_assimilation_rate_flux=Node(
    :div,
    co2_assimilation_rate_flux #checkbox(style=Dict(:border=>"solid 1px black")),
  )

check_co2_assimilation_rate_quant=Node(
    :div,
    co2_assimilation_rate_quant#checkbox(style=Dict(:border=>"solid 1px black")),
  )


  co2_assimilation_rate= hbox(co2_assimilation_rate_label,hskip(10px),check_co2_assimilation_rate_flux, hskip(20px),check_co2_assimilation_rate_quant)


# 2) Stomatal conductance

s_conductance_label= Node(
    :div,
    node(:label,"Stomatal conductance", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
  
  ),
)

#Checkbox

s_conductance= checkbox(#label="Flux", 
style=Dict(:border=>"solid 1px black"))
#s_conductancequant = checkbox(#label="Quantity",
#style=Dict(:border=>"solid 1px black"))

#Make observable on "surface hits"

hscf= on(s_conductance) do valscf
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["Gs"]=valscf
end 


check_s_conductance=Node(
    :div,
    s_conductance#checkbox(style=Dict(:border=>"solid 1px black")),
  )

 

s_conductance= hbox(s_conductance_label,hskip(10px),check_s_conductance)


# Join all checkbox parameters in param7_out

param7_out = vbox(
vskip(20px),
hbox(hskip(50px),assimilation_label),
vskip(70px),
hbox(hskip(220px),
vbox(
hbox(icon2,hskip(5px),co2_assimilation_rate),
vskip(50px),
hbox(icon2,hskip(5px),s_conductance)))
    
)



########################## Left-side,Parameters 8= param8_out###########################

# Section : Energy 
 
energy_label= Node(
  :div,
  node(:label,"Energy", style=Dict(:padding=>"20px", :color=>"black",:backgroundColor => "rgba(212, 151, 133, 1)",:border=>"solid 1px rgba(212, 151, 133, 1)", :height=>"100px", :width=>"200px")

),
)


# 1) Sensible heat

sensible_heat_label= Node(
    :div,
    node(:label,"Sensible heat", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
  
  ),
)

#Checkbox

sensible_heat_flux = checkbox(label="Flux",style=Dict(:border=>"solid 1px black"))
sensible_heat_quant = checkbox(label="Quantity",style=Dict(:border=>"solid 1px black"))

#Make observable on "surface hits"

hshf= on(sensible_heat_flux) do valshf
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["H_f"]=valshf
end 

hshq= on(sensible_heat_quant) do valshq
  #println("Got an update: ", val) # changer la valeur dans le dict
  model["H_q"]=valshq
end 


check_sensible_heat_flux=Node(
    :div,
    sensible_heat_flux #checkbox(style=Dict(:border=>"solid 1px black")),
  )

check_sensible_heat_quant=Node(
    :div,
    sensible_heat_quant#checkbox(style=Dict(:border=>"solid 1px black")),
  )


  sensible_heat= hbox(sensible_heat_label,hskip(10px),check_sensible_heat_flux, hskip(20px),check_sensible_heat_quant)


# 2) Latent heat

latent_heat_label= Node(
    :div,
    node(:label,"Latent heat", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
  
  ),
)

#Checkbox

latent_heat_flux= checkbox(label="Flux", style=Dict(:border=>"solid 1px black"))
latent_heat_quant = checkbox(label="Quantity", style=Dict(:border=>"solid 1px black"))

#Make observable on "surface hits"

hlhf= on(latent_heat_flux) do vallhf
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["LE_q"]=vallhf
end 


hlhq= on(latent_heat_quant) do vallhq
  #println("Got an update: ", val) # changer la valeur dans le dict
  model["LE_f"]=vallhq
end



check_latent_heat_flux=Node(
    :div,
    latent_heat_flux#checkbox(style=Dict(:border=>"solid 1px black")),
  )



  check_latent_heat_quant=Node(
    :div,
    latent_heat_quant#checkbox(style=Dict(:border=>"solid 1px black")),
  )

  latent_heat= hbox(latent_heat_label,hskip(10px),check_latent_heat_flux, hskip(20px),check_latent_heat_quant)



# Join all checkbox parameters in param8_out

param8_out = vbox(
vskip(20px),
hbox(hskip(50px),energy_label),
vskip(70px),
hbox(hskip(50px),
vbox(
hbox(icon2,hskip(5px),sensible_heat),
vskip(50px),
hbox(icon2,hskip(5px),latent_heat)))
    
)



########################## Left-side,Parameters 9= param9_out###########################

# 1) Transpiration

transpiration_label= Node(
    :div,
    node(:label,"Transpiration", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
  
  ),
)

#Checkbox

transpiration_flux = checkbox(label="Flux",style=Dict(:border=>"solid 1px black"))
transpiration_quant = checkbox(label="Quantity",style=Dict(:border=>"solid 1px black"))

#Make observable on "surface hits"

htrf= on(transpiration_flux) do valtrf
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["Tr_f"]=valtrf
end 

htrq= on(transpiration_quant) do valtrq
  #println("Got an update: ", val) # changer la valeur dans le dict
  model["Tr_q"]=valtrq
end 


check_transpiration_flux=Node(
    :div,
    transpiration_flux #checkbox(style=Dict(:border=>"solid 1px black")),
  )

check_transpiration_quant=Node(
    :div,
    transpiration_quant#checkbox(style=Dict(:border=>"solid 1px black")),
  )


  transpiration= hbox(transpiration_label,hskip(10px),check_transpiration_flux, hskip(20px),check_transpiration_quant)


# 2) Temperature

temperature_label= Node(
    :div,
    node(:label,"Temperature", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
  
  ),
)

#Checkbox

ch_temperature = checkbox(label="Flux",style=Dict(:border=>"solid 1px black"))

#Make observable on "surface hits"

htmp= on(ch_temperature) do valtmp
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["T"]=valtmp
end 



check_temperature=Node(
    :div,
    ch_temperature #checkbox(style=Dict(:border=>"solid 1px black")),
  )



  temperature= hbox(temperature_label,hskip(10px),check_temperature)


# Join all checkbox parameters in param9_out


param9_out = vbox(

vskip(70px),
hbox(hskip(50px),
vbox(
hbox(icon, transpiration),
vskip(50px),
hbox(icon, temperature)))
    
)


# create a div between param8_out and param9_out

param8bis_out= hbox(param8_out,hskip(50px),divparam2_out)


# Put the div on top of parameter 9 "param4_out"

param9bis_out=vbox(divparam2_out,vskip(58px), 
param9_out)

# Merge param1_out with param2_out

param_89_out=hbox(hskip(30px),param8bis_out,param9bis_out)



################ Merge all params (from param1_out to param9_out) in colored background div ######################


param_all_out= Node(
        :div,
        vskip(30px),
        param_12_out,
        vskip(50px),
        param_34_out,
        vskip(50px),
        param_56_out,
        vskip(50px),
        param7_out,
        vskip(50px),
        param_89_out,
        style=Dict(
        :backgroundColor => "rgba(241, 247, 213, 0.53)",#vert clair=rgba(184, 244, 190, 0.36)rgba(241, 247, 213, 0.53)rgba(241, 247, 213, 0.39)
        :color => "black",
        :border=>"solid 0.2px rgba(241, 247, 213, 0.53)",#rgba(111, 188, 96, 1)rgba(111, 188, 96, 1) = green
        #:padding=>"10px 100px 5px 5px"
    ),
)


############################ Add images on the left #####################################

ui1_out=hbox(images_out, hskip(5px),param_all_out)  # ui1=hbox(logo,param_all) 

#Show ui1
w=Window()
body!(w,ui1_out)


#Merge tab buttons with ui1 add div2 on the right to leave a space

ui2_out=vbox(
    hbox(hskip(150px),tab_out),vskip(5px),ui1_out
    
    )

#Show ui2
w= Window()
body!(w,ui2_out)

################################# Add the top menu buttons to all (put all in a div)##################
logos=hbox(hskip(1200px),logo3#,amaplab
)#logos=hbox(hskip(150px),logoamap,hskip(500px),logo2)
#uif=vbox(ui2,logos)

w= Window()
body!(w,logos)


UI_out=Node(
    :div,
    node(:button,"File"),
    node(:button,"Edit"),
    node(:button,"Help"),
    vskip(30px),
   ui2_out,
    
    style=Dict(
        :backgroundColor => "white",
        :color => "black",
        #:padding=>"300px"
       :border=>"solid 1px grey"#black
    ),

)

UI_1_out=vbox(UI_out,logos)
############################ Show input page 1 Archimed UI #####################################

w= Window()
body!(w,UI_1_out)