using Blink, WebSockets, WebIO, Interact, Observables, CSSUtil, Markdown, ImageShow, Colors, AssetRegistry , OrderedCollections, YAML
#function run()


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

b4=dom"button"("Input",style=Dict(:borderRadius=> "10px",:padding=>"5px",:background=>"rgba(122, 199, 199, 0.62)",:color=>"black",:fontWeight=>"weight",:border=>"solid 1px ",:width => "60px",
:height => "50px"))

b5=dom"button"("Output",style=Dict(:borderRadius=> "10px",:padding=>"5px",:background=>"rgba(196, 196, 196, 0.62)",:color=>"black",:fontWeight=>"weight",:border=>"solid 1px ",:width => "60px",
:height => "50px"))

b6=dom"button"("Settings",style=Dict(:borderRadius=> "10px",:padding=>"5px",:background=>"rgba(122, 199, 199, 0.62)",:color=>"black",:fontWeight=>"weight",:border=>"solid 0.7px",:width => "100px",
:height => "50px"))

b7=dom"button"("Scene/Model",style=Dict(:borderRadius=> "10px",:padding=>"5px",:background=>"rgba(196, 196, 196, 0.62)",:color=>"black",:font=>"weight",:border=>"solid 0.7px",:width => "100px",
:height => "50px"))

b8=dom"button"("Meteo",style=Dict(:borderRadius=> "10px",:padding=>"5px",:background=>"rgba(196, 196, 196, 0.62)",:color=>"black",:font=>"weight",:border=>"solid 0.7px",:width => "70px",
:height => "50px"))

save=dom"button"("Save changes",style=Dict(:borderRadius=> "10px",:padding=>"5px",:background=>"rgba(122, 199, 199, 0.62)",:color=>"black",:font=>"bold",:border=>" solid 0.5px ",:width => "100px",
:height => "30px")) # Make observable on button save



# Buttons ordered as a navigation menu
tab=vbox(hbox(b1,b2,b3),hbox(hskip(10px),b4,b5),hbox(hskip(20px),b6,b7,b8))


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



##########################Left-side, Parameters 1= Textboxes###########################

# Title Settings section

input_settings= Node(
:div,
node(:label,"Input Settings", style=Dict(:padding=>"20px", :color=>"black",:backgroundColor => "rgba(212, 151, 133, 1)",:border=>"solid 1px rgba(212, 151, 133, 1)", :height=>"100px", :width=>"200px"),

),
)

#Path to the config file example to be replaced by joinpath

#file="E:/Stage_julia/ExemplAppli/src/Test/config.yml"

file="E:/Stage_julia/ExemplAppli/Archimed_Application/archimed-ui/default_files/config.yml"

# joinpath(dirname(pathof(archimedUI)),"../default_files/config.yml")

# Create parameters inputs and Display them on the left side . The position of the "style=Dict()" has no effect on the results

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



# Create the variable sky sector wich is observable
# Create a Dict with default values (créer un dict avec valeurs par default)
#model=Dict()
skysector_default=[1, 6, 16, 46, 136,406]
skysectors= dropdown(skysector_default)#, label="Sky sectors")


# 1) sky_sectors
label_skysector= Node(
:div,
node(:label,"Sky sectors", style=Dict(:padding=>"10px 20px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)")

),
)

skysector=Node(
:div,
skysectors#dropdown(skysector_default)
)

# Make observable on "sky sectors
h = on(skysectors) do val
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["sky_sectors"]=val
end    

skysec= hbox(label_skysector,hskip(10px),skysector)




# 2) "scene_rotation"
label_scenerotation= Node(
:div,
node(:label,"Scene rotation", style=Dict(:padding=>"10px 20px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)")

),
)

scenerotation= textbox(style=Dict(:border=>"solid 1px",:background=>"white", :color=>"black", :size=>"10px"),
value = 0
)

scen_rota=Node(
:div,
scenerotation
)
# Make observable on scene rotation

hr = on(scenerotation) do valr
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["scene_rotation"]=valr
end 

scene_rotation= hbox(label_scenerotation,hskip(10px),scenerotation)

# 3) Radiation timestep

radiation_tps=textbox(label = "Radiation timestep",
value = 5, 
style=Dict(:border=>"solid 1px",:background=>"white", :color=>"black", :size=>"10px"))


hrad = on(radiation_tps) do valrad
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["radiation_timestep"]=valrad
end 


# 4) Pixel size  

pixel_size=textbox(label = "Pixel size",
value = 0.3, 
style=Dict(:border=>"solid 1px",:background=>"white", :color=>"black", :size=>"10px"))

hpx = on(pixel_size) do valx
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["pixel_size"]=valx
end 

param1=vbox(vskip(20px),
hbox(hskip(10px),label_settings),
vskip(50px),
hbox(hskip(150px),vbox(
#icon,hskip(5px),
config_file,#vskip(10px),hbox(hskip(110px),save))),
vskip(50px),#hskip(148px),
hbox(icon2,hskip(5px),
scene_rotation),#scene_rotation),
vskip(20px),
hbox(#hskip(120px),
icon,hskip(5px),
skysec),#skysector),
vskip(10px),
hbox(icon,#hskip(0.5px),
radiation_tps), 
vskip(10px),
hbox(icon2,#hskip(5px),
pixel_size),
vskip(50px),hbox(hskip(300px),save)))
)



#############################Right-side Parameters 2 = Checkboxes#######################
# Create checkboxes

# 1) All in turtle

#checkboxes(value = value)

all_in_turtle= Node(
:div,
node(:label,"All in turtle", style=Dict(:padding=>"10px", :color=>"black"),  #:backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),

),
)

All_in_turt = checkbox(style=Dict(:border=>"solid 1px black"))

#Make observable on "all in turtle"

ht = on(All_in_turt) do valt
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["all_in_turtle"]=valt
end 


check_All_in_turt=Node(
:div,
All_in_turt,#checkbox(style=Dict(:border=>"solid 1px black")),
)


a_in_t= hbox(all_in_turtle,hskip(10px),check_All_in_turt)


# 2) Scattering

scattering= Node(
:div,
node(:label,"Scattering", style=Dict(:padding=>"10px", :color=>"black"),# :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),

),
)


scat = checkbox(style=Dict(:border=>"solid 1px black"))

#Make observable on "scattering"

hs = on(scat) do vals
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["scattering"]=vals
end 

check_scat=Node(
:div,
scat, #checkbox(style=Dict(:border=>"solid 1px black")),
)


scatt= hbox(scattering,hskip(10px),check_scat)


# 3) Toricity

toricity= Node(
:div,
node(:label,"Toricity", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),

),
)

tor = checkbox(style=Dict(:border=>"solid 1px black"))

#Make observable on "toricity"

htr = on(tor) do valtr
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["toricity"]=valtr
end 



check_tori=Node(
:div,
tor,#checkbox(style=Dict(:border=>"solid 1px black")),
)


torici= hbox(toricity,hskip(10px),check_tori)


# 4) Pixel table

c_pixel_table= Node(
:div,
node(:label,"cache pixel table", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),

),
)

c_pix_table= checkbox(style=Dict(:border=>"solid 1px black"))

# Make observable on "pixel table"
hxt = on(c_pix_table) do valxt
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["cache_pixel_table"]=valxt
end 

check_pix_table=Node(
:div,
c_pix_table,#checkbox(style=Dict(:border=>"solid 1px black")),
)


c_p_table= hbox(c_pixel_table,hskip(10px),check_pix_table)

# 5) Cache radiation

cache_radiation= Node(
:div,
node(:label,"cache pixel table", style=Dict(:padding=>"10px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),

),
)


c_radiation=checkbox(style=Dict(:border=>"solid 1px black"))

# Make observable on "cache radiation"
hc = on(c_radiation) do valc
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["cache_radiation"]=valc
end

check_c_radiation=Node(
:div,
c_radiation,#checkbox(style=Dict(:border=>"solid 1px black")),
)


cache_rad= hbox(cache_radiation, hskip(10px), check_c_radiation)

# Join all checkbox parameters in param2

param2 = vbox(
vskip(20px),hbox(icon2,hskip(5px),a_in_t),
vskip(10px),hbox(icon,scatt),
vskip(20px),hbox(icon,torici),
vskip(30px),hbox(icon2,hskip(5px),c_p_table),
vskip(30px),hbox(icon,cache_rad)

)


# create a div to push down parameters2

divparam2= Node(
:div,

style=Dict(
:backgroundColor => "rgba(241, 247, 213, 0.25)",#rgba(241, 247, 213, 0.39)
#:padding=>"70px"
#:border=>"solid"

),

)


# Put the div on top of checkbottons (parameter 2)

param2bis=vbox(divparam2,vskip(110px), 
param2)


#essayer de faire le merge de param1 avec le node (:div avc background vert 
#avant de rajouter la div2 à droite de param2 pour vérifier si la couleur du background change )

div1= Node(
#hskip(100em),
:div,

#Add a vertical line
style=Dict(
:backgroundColor => "white",#rgba(196, 196, 196, 0.18)#rgba(241, 247, 213, 0.39)rgba(241, 247, 213, 0.25)
:padding=>"60px",
#:border=>"solid 1px grey"

),

)

#Test : Add div1 on the left of param1
param_1=hbox(#div1,
vline(),
param1)



# Create a div to put on the rignt of checkboxes(param2) and on the left of textboxes(param1)
div2= Node(
#hskip(100em),
:div,

style=Dict(
:backgroundColor => "red"#dcdadb",#rgba(196, 196, 196, 0.18)#rgba(241, 247, 213, 0.39)rgba(241, 247, 213, 0.25)
#:padding=>"50px"#100px
#:border=>"solid 0.07px grey"#rgba(111, 188, 96, 1)

),

)


#put the div2 on the right side of param2 (checkboxes)
# Merge div2 on the right with param_2

param_2=hbox(param2bis, #vline())
div2)



############################Merge left side(param1) and right side(param2)#############################

param_12=hbox(hskip(30px),param1,param2bis)#_1
#,param_2)#, vline())


###################### Parameters 3 : Scene & Soil & Plan models   ########################

#joinpath(dirname(pathof(archimedUI)),"../default_files/config.yml")


# Title Scene / Model section

label_sc_model= Node(
:div,
node(:label,"Scene / Model", style=Dict(:padding=>"20px", :color=>"black",:backgroundColor => "rgba(212, 151, 133, 1)",:border=>"solid 1px rgba(212, 151, 133, 1)", :height=>"100px", :width=>"200px"),

),
)


# Create label for ops file

#ops_file=filepicker(label="Choose the ops file", style=Dict(:color=>"black"); multiple=false, accept=".ops")

label_ops= Node(
:div,
node(:label,"Choose the ops file", style=Dict(:padding=>"20px", :color=>"black",:backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),

),
)

ops_file=filepicker(label=label_ops; multiple=false, accept=".ops")




file_ops=Node(
:div,
ops_file,
style=Dict(:color=>"black",:backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px black"),#dropdown(skysector_default)
)



# Create label for plant file

# plant_file=filepicker(label="Choose the plant model file", style=Dict(:color=>"black"); multiple=false, accept=".yml")

label_plant= Node(
:div,
node(:label,"Choose the plant file", style=Dict(:padding=>"5px", :color=>"black",:backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),

),
)

plant_file=filepicker(label=label_plant; multiple=false, accept=".yml")



file_plant=Node(
:div,
plant_file,
style=Dict(:color=>"black",:backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px black")
)


# Create label for soil file

# soil_file=filepicker(label="Choose the soil model file", style=Dict(:color=>"black"); multiple=false, accept=".yml")

label_soil= Node(
:div,
node(:label,"Choose the soil file", style=Dict(#:padding=>"10px", 
:color=>"black",:backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),

),
)

soil_file=filepicker(label=label_soil; multiple=false, accept=".yml")



file_soil=Node(
:div,
soil_file,
style=Dict(:color=>"black",:backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px black")
)




# Merge all the files in param 3

param3= vbox(
hbox(hskip(30px),label_sc_model),
vskip(50px),
hbox(hskip(200px),file_ops),
vskip(30px), 
hbox(hskip(200px),file_plant), 
vskip(30px), 
hbox(hskip(200px),file_soil)

)


#param_3= Node(
#       :div,
#param3,
#style=Dict(
#       :backgroundColor => "rgba(241, 247, 213, 0.53)",#vert clair=rgba(184, 244, 190, 0.36)rgba(241, 247, 213, 0.53)rgba(241, 247, 213, 0.39)
#      :color => "black",
#     #:padding=>"300px"
#    :border=>"solid 0.2px rgba(241, 247, 213, 0.53)  "#rgba(111, 188, 96, 1)rgba(111, 188, 96, 1) = green

# ),
#)


###################### Parameters 4 : Meteo   ########################

# Title Meteo section

section_meteo= Node(
:div,
node(:label,"Meteo", style=Dict(:padding=>"20px", :color=>"black",:backgroundColor => "rgba(212, 151, 133, 1)",:border=>"solid 1px rgba(212, 151, 133, 1)", :height=>"100px", :width=>"200px"),

),
)


# Import meteo file

label_meteo= Node(
:div,
node(:label,"Choose the meteo file", style=Dict(:padding=>"5px", :color=>"black",:backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)"),

),
)

meteo_file=filepicker(label=label_meteo; multiple=false, accept=".csv")



file_meteo=Node(
:div,
meteo_file,
style=Dict(:color=>"black",:backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px black")
)



# Meteo range

label_meteo_range= Node(
:div,
node(:label,"Meteo range", style=Dict(:padding=>"10px 20px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)")

),
)


meteo_range= textbox(style=Dict(:border=>"solid 1px",:background=>"white", :color=>"black", :size=>"10px"),
value = 2
)

meteorange=Node(
:div,
meteo_range
)

hm = on(meteo_range) do valm
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["meteo_range"]=valm
end 

# Meteo range bis

label_meteo_range= Node(
:div,
node(:label,"Meteo range", style=Dict(:padding=>"10px 20px",  :backgroundColor => "rgba(184, 244, 190, 0.36)",:border=>"solid 1px rgba(184, 244, 190, 0.36)")

),
)

meteo_range1= textbox(label= "From", style=Dict(:border=>"solid 1px",:background=>"white", :color=>"black", :size=>"10px"),
value = "8:00:00"
)

meteo_range2= textbox(label= "To", style=Dict(:border=>"solid 1px",:background=>"white", :color=>"black", :size=>"10px"),
value = "12:00:00"
)

hm1 = on(meteo_range1) do valm1
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["meteo_range"]=valm1
end 

hm2 = on(meteo_range2) do valm2
    #println("Got an update: ", val) # changer la valeur dans le dict
    model["meteo_range"]=valm2
end 

meteorange_bis= vbox(#hskip(5px), 
meteo_range1, #hskip(5px), 
meteo_range2)

# Merge param 4 elements:

param4 = vbox(hbox(hskip(30px),section_meteo), 
vskip(50px),
hbox(hskip(200px), file_meteo),
vskip(30px),
hbox(hskip(200px),icon,label_meteo_range, hskip(10px), meteo_range),
vskip(30px),
hbox(hskip(200px),icon2,label_meteo_range, vskip(20px), meteorange_bis)


)


################Add a colored background div to param_12 and param3######################
param_all= Node(
:div,
vskip(30px),
param_12,
vskip(50px),
param3,
vskip(50px),
param4,
style=Dict(
:backgroundColor => "rgba(241, 247, 213, 0.53)",#vert clair=rgba(184, 244, 190, 0.36)rgba(241, 247, 213, 0.53)rgba(241, 247, 213, 0.39)
:color => "black",
#:padding=>"300px"
:border=>"solid 0.2px rgba(241, 247, 213, 0.53)  "#rgba(111, 188, 96, 1)rgba(111, 188, 96, 1) = green

),
)



############################ Add images on the left #####################################

ui1=hbox(images, hskip(5px),param_all)  # ui1=hbox(logo,param_all) 



#Merge tab buttons with ui1 add div2 on the right to leave a space

ui2=vbox(
hbox(hskip(150px),tab),vskip(5px),ui1

)



################################# Add the top menu buttons to all (put all in a div)##################
logos=hbox(hskip(1800px),logo3,amaplab)#logos=hbox(hskip(150px),logoamap,hskip(500px),logo2)




UI=Node(
:div,
node(:button,"File"),
node(:button,"Edit"),
node(:button,"Help"),
vskip(30px),
ui2,

style=Dict(
:backgroundColor => "white",
:color => "black",
#:padding=>"300px"
:border=>"solid 1px grey"#black
),

)

UI_1=vbox(UI,logos)


############################ Show input page 1 Archimed UI #####################################

w= Window()
body!(w,UI_1)
#end
#run()