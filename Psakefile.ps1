Properties {
    $APP_NAME='windows-postgres'
    # currently v11
    $INSTALLER_URI='https://sbp.enterprisedb.com/getfile.jsp?fileid=1258247'
}

Task Build {
	Write-Host 'Building image...'
    docker build `
        --build-arg "INSTALLER_URI=$INSTALLER_URI" `
        --tag "ghcr.io/$($env:GITHUB_ACCOUNT)/$APP_NAME" `
        --tag "$APP_NAME`:latest" `
        .
}

Task Terminal {
	Write-Host 'Starting terminal...'
    docker run -it --rm "$APP_NAME`:latest" powershell
}

Task Publish {
	Write-Host 'Publishing image to Github...'
	$env:GITHUB_TOKEN | docker login ghcr.io -u $env:GITHUB_ACCOUNT --password-stdin
    docker tag $APP_NAME "ghcr.io/$($env:GITHUB_ACCOUNT)/$APP_NAME"
	docker push "ghcr.io/$($env:GITHUB_ACCOUNT)/$APP_NAME`:latest"
}