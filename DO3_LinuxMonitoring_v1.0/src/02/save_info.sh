save_info(){
    read -p "Хотите сохранить данные в файл? (Y/N): " save_response

    save_response=${save_response:-Y}

    if [[ "$save_response" =~ ^[Yy]$ ]]; then
        timestamp=$(date "+%d_%m_%y_%H_%M_%S")
        filename="${timestamp}.status"
        print_info > $filename
        echo "Информация сохранена в файл $filename"
    else
        echo "Информация не была сохранена."
    fi
}