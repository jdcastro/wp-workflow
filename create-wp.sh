#!/bin/bash
# By Johnny De Castro 2022
# jdcastro@unweb.co

wpurl="https://es.wordpress.org/latest-es_ES.tar.gz"
listwp=(advanced-custom-fields classic-editor duplicator imsanity jetpack sucuri-scanner w3-total-cache wordpress-seo wp-all-import wp-optimize wporlogin under-construction-page)
listwoo=(facebook-for-woocommerce mailchimp-for-woocommerce onwebchat woocommerce woocommerce-admin woocommerce-xml-csv-product-import)

function create() {
    echo "creando proyecto $1 tipo wordpress simple"
    wget -c $wpurl
    tar  -xzf latest-es_ES.tar.gz
    rm latest-es_ES.tar.gz
    mv wordpress $1
    cd $1
    # wp core download --locale=es_ES --force
    for j in ${list[@]}
    do
        printf "Instalando Plugins $j"
        curl -O https://downloads.wordpress.org/plugin/$j.zip
        https://downloads.wordpress.org/plugin/under-construction-page.zip
        unzip $j.zip -d wp-content/plugins/
        rm $j.zip
    done
}

case $2 in

  wp)
    re='^[a-zA-Z0-9]+$'
    if [[ $1 =~ $re ]]
        then
            list=("${listwp[@]}")
            create $1 ${list[@]}
    else 
        echo "error: el nombre del proyecto solo puede contener letras y números" >&2; exit 1
    fi
    ;;

  woo)
    re='^[a-zA-Z0-9]+$'
    if [[ $1 =~ $re ]]
        then
            list=("${listwp[@]}" "${listwoo[@]}")
            create $1 ${list[@]}
    else 
        echo "error: el nombre del proyecto solo puede contener letras y números" >&2; exit 1
    fi
    ;;

  *)
    printf "Modo de Uso:\n$0 proyectname type\n Types: wp and woo\n"
    ;;
esac
