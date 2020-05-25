#!/bin/bash
# Script by jdcastro@unweb.co 
# Install wp and plugins 
cat <<'EOF' >> composer.json
{
        "name": "unweb/localsite",
        "description": "Devel WordPress site",
        "repositories":[
                {
                        "type":"composer",
                        "url":"https://wpackagist.org"
                }
        ],
        
        "require": {
            "php": ">=7.3",
            "aws/aws-sdk-php":"*",
            "johnpbloch/wordpress": "*",
            "wpackagist-theme/hueman":"*",
            "wpackagist-plugin/classic-editor":"*",
            "wpackagist-plugin/duplicator":"*",
            "wpackagist-plugin/facebook-for-woocommerce":"*",
            "wpackagist-plugin/jetpack":"*",
            "wpackagist-plugin/mailchimp-for-woocommerce":"*",
            "wpackagist-plugin/onwebchat":"*",
            "wpackagist-plugin/sucuri-scanner":"*",
            "wpackagist-plugin/w3-total-cache":"*",
            "wpackagist-plugin/woocommerce":"*",
            "wpackagist-plugin/woocommerce-admin":"*",
            "wpackagist-plugin/woocommerce-xml-csv-product-import":"*",
            "wpackagist-plugin/wordpress-seo":"*",
            "wpackagist-plugin/wp-all-import":"*"
        },
        "extra": {
            "wordpress-install-dir": "wps",
            "installer-paths": {
                "wps/wp-content/plugins/{$name}/": ["type:wordpress-plugin"],
                "wps/wp-content/themes/{$name}/": ["type:wordpress-theme"]
            }
          },
        "autoload": {
                "psr-0": {
                        "Acme": "src/"
                }
        }
}

EOF
composer install
