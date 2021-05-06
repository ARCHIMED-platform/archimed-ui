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

tab_out=vbox(hbox(b1,b2,b3),hbox(hskip(10px),b4,b5),hbox(hskip(20px),b6,b7), hbox(hskip(50px),b8,b9,b10,b11,b12))


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
         dom"img"(src= "/assetserver/2472b409007a2c8d4d07710da7345aafac013e66-amap_logo.png") #"/assetserver/b7d3c7db9554b821703d9724547ddd562ef41ed3-amap.png")
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
 
 images=vbox(
         #vskip(50px),
         hbox(hskip(10px),img_palm),vskip(30px), hbox(hskip(13px),img_tree),vskip(30px),hbox(hskip(13px),img_coffee),#,vskip(100px), #logo_amap
         vskip(30px),
         hbox(hskip(10px),img_palm),vskip(30px), hbox(hskip(13px),img_tree),vskip(30px),hbox(hskip(13px),img_coffee)
         )
 
 w=Window()
 body!(w, images)
 
 ##########################Left-side, Parameters 1=checkboxex###########################
 
 # Title Settings section
 
 output_settings= Node(
         :div,
         node(:label,"Output Settings", style=Dict(:padding=>"20px", :color=>"black",:backgroundColor => "rgba(212, 151, 133, 1)",:border=>"solid 1px rgba(212, 151, 133, 1)", :height=>"100px", :width=>"200px")
       
       ),
 )


# Create checkboxes

# 1) Step Number 

values = ["true", "false"]  #values = ["true"] ???

 stepnumber= Node(
         :div,
         node(:label,"Step number", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
       
       ),
 )

#Checkbox
 
 stepnum = checkbox(values, style=Dict(:border=>"solid 1px black"))
 
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
 
 stepdur = checkbox(values, style=Dict(:border=>"solid 1px black"))
 
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

item = checkbox(values, style=Dict(:border=>"solid 1px black"))

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
 
 compid = checkbox(values, style=Dict(:border=>"solid 1px black"))
 
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

grp = checkbox(values, style=Dict(:border=>"solid 1px black"))

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
 
typ = checkbox(values, style=Dict(:border=>"solid 1px black"))
 
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


 # Join all checkbox parameters in param1_out

param1_out = vbox(hbox(hskip(30px),output_settings)
    vskip(20px),
    hbox(icon2,hskip(5px),step_number),
    vskip(30px),
    hbox(icon2,hskip(5px),step_duration),
    vskip(30px),
    hbox(icon2,hskip(5px),item_id),
    vskip(30px),
    hbox(icon2,hskip(5px),component_id),
    vskip(30px),
    hbox(icon2, hskip(5px),group)
    
    )


# Show param1_out

w=Window()

body!(w,param1_out)





  ##########################Right-side, Parameters 2=checkboxex###########################

  # 7) Area

area_label= Node(
    :div,
    node(:label,"Area", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
  
  ),
)

#Checkbox

are = checkbox(values, style=Dict(:border=>"solid 1px black"))

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


# 8) Surface hits

surfhit_label= Node(
    :div,
    node(:label,"Surface hits", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),
  
  ),
)

#Checkbox

surfhit = checkbox(values, style=Dict(:border=>"solid 1px black"))

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

baryx = checkbox(values, style=Dict(:border=>"solid 1px black"))

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

bary = checkbox(values, style=Dict(:border=>"solid 1px black"))

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

baryz = checkbox(values, style=Dict(:border=>"solid 1px black"))

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

skyfrac = checkbox(values, style=Dict(:border=>"solid 1px black"))

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
    hbox(icon,hskip(5px),area),
    vskip(30px),
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



# Merge param1_out with param2_out

param_12_out=hbox(hskip(30px),param1_out,param2_out)#_1

# Show param2_out

w=Window()

body!(w,param_12_out)


param_all_out= Node(
        :div,
        vskip(30px),
     
        param_12_out,
        style=Dict(
        :backgroundColor => "rgba(241, 247, 213, 0.53)",#vert clair=rgba(184, 244, 190, 0.36)rgba(241, 247, 213, 0.53)rgba(241, 247, 213, 0.39)
        :color => "black",
        #:padding=>"300px"
        :border=>"solid 0.2px rgba(241, 247, 213, 0.53)  "#rgba(111, 188, 96, 1)rgba(111, 188, 96, 1) = green

    ),
)

ui1_out=hbox(images, hskip(5px),param_all_out)  # ui1=hbox(logo,param_all) 

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
logos=hbox(hskip(1800px),logo3,amaplab)#logos=hbox(hskip(150px),logoamap,hskip(500px),logo2)
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