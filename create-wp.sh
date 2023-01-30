#!/bin/bash
# By Johnny De Castro 2022
# jdcastro@unweb.co

function create() {
    echo "creando proyecto $1 tipo wordpress simple"
    mkdir $1
    cd $1
    wp core download --locale=es_ES --force
    for j in ${list[@]}
    do
        printf "Instalando Plugins $j"
        curl -O https://downloads.wordpress.org/plugin/$j.zip
        unzip $j.zip -d wp-content/plugins/
        rm $j.zip
    done
}

case $2 in

  wp)
    re='^[a-zA-Z0-9]+$'
    if [[ $1 =~ $re ]]
        then
            list=(advanced-custom-fields classic-editor duplicator imsanity jetpack sucuri-scanner w3-total-cache wordpress-seo wp-all-import wp-optimize)
            create $1 ${list[@]}
    else 
        echo "error: el nombre del proyecto solo puede contener letras y números" >&2; exit 1
    fi
    ;;

  woo)
      re='^[a-zA-Z0-9]+$'
    if [[ $1 =~ $re ]]
        then
            list=(classic-editor duplicator facebook-for-woocommerce jetpack mailchimp-for-woocommerce onwebchat sucuri-scanner w3-total-cache woocommerce woocommerce-admin woocommerce-xml-csv-product-import wordpress-seo wp-all-import imsanity advanced-custom-fields wp-optimize)
            create $1 ${list[@]}
    else 
        echo "error: el nombre del proyecto solo puede contener letras y números" >&2; exit 1
    fi
    ;;

  *)
    printf "Modo de Uso:\n$0 proyectname type\n Types: wp and woo\n"
    ;;
esac
