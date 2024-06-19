function pubadd --wraps='dart pub add' --description 'alias pubadd=dart pub add'
    if ls pubspec.yaml >/dev/null 2>&1
        if not [ "$argv[1]" ]
            echo "firebase, freezed"
        else
            if [ $argv[1] = firebase ]
                set -l packs firebase_core firebase_auth cloud_firestore firebase_storage firebase_app_check cloud_functions firebase_messaging
                for i in $packs
                    dart pub add $i
                end
            else if [ $argv[1] = freezed ]
                dart pub add freezed_annotation
                dart pub add --dev build_runner
                dart pub add --dev freezed
                dart pub add --dev json_serializable
                dart pub add json_annotation
            else if [ $argv[1] = odm ]
                dart pub add cloud_firestore_odm
                dart pub add --dev cloud_firestore_odm_generator
                dart pub add --dev json_serializable
                dart pub add --dev json_serializable
                dart pub add json_annotation
            else
                for i in $argv
                    dart pub add $i
                end
            end
        end
    else
        echo "Invalid Dart Project"
    end
end
