import java.text.SimpleDateFormat

node {
  try {
    stage('Checkout git') {
     # sh "git pull https://huhji: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@github.com/huhji/k8s-manifest-repo main --allow-unrelated-histories"
      slackSend channel: '#cicd', color: '#FF0000', message: "${JOB_NAME} - #${BUILD_NUMBER} Pull Repository", teamDomain: 'k8sproject5', tokenCredentialId: 'kakaonibs-slack'
    }
    def imageTag = getLatestBuildNumber()
    stage('[Update] classification-deployment.yaml') {
      sh "rm -rf classification-deployment.yaml"
      sh """
      cat <<EOF> classification-deployment.yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: image-classification
  namespace: default
spec:
  replicas: 3
  selector:
    matchLabels:
      app: image-classification
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      labels:
        app: image-classification
    spec:
      containers:
        - name: image-classification
          image: 525348550799.dkr.ecr.ap-southeast-1.amazonaws.com/image-classification:${imageTag}
          imagePullPolicy: Always
          ports:
            - containerPort: 8080
          env:
            - name: ACCOUNT_ID
              valueFrom:
                secretKeyRef:
                  name: aws-pass-secret
                  key: ACCOUNT_ID
            - name: ACCESS_KEY
              valueFrom:
                secretKeyRef:
                  name: aws-pass-secret
                  key: ACCESS_KEY
            - name: BUCKET_NAME
              valueFrom:
                secretKeyRef:
                  name: aws-pass-secret
                  key: BUCKET_NAME
      EOF
      """ 
      slackSend channel: '#cicd', color: '#FF0000', message: "${JOB_NAME} - #${BUILD_NUMBER} Version Update", teamDomain: 'k8sproject5', tokenCredentialId: 'kakaonibs-slack'
    }
    stage('[Update] frontend-deployment.yaml') {
      sh "rm -rf frontend-deployment.yaml"
      sh """
      cat <<EOF> frontend-deployment.yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: react-frontend
  namespace: default
spec:
  replicas: 3
  selector:
    matchLabels:
      app: react-frontend
  template:
    metadata:
      labels:
        app: react-frontend
    spec:
      containers:
        - name: react-frontend
          image: 525348550799.dkr.ecr.ap-southeast-1.amazonaws.com/react-frontend:${imageTag}
          imagePullPolicy: Always
          ports:
            - containerPort: 80
          env:
            - name: PLATE_DETECTION_URL
              value: "http://plate-detection-service.default.svc.cluster.local/"
            - name: POSE_ESTIMATION_URL
              value: "http://pose-estimation-service.default.svc.cluster.local/"
            - name: YOLOv5_DETECTION_URL
              value: "http://yolov5-detection-service.default.svc.cluster.local/"
            - name: CLASSIFICATION_URL
              value: "http://classification-service.default.svc.cluster.local/"
      EOF
      """ 
      slackSend channel: '#cicd', color: '#FF0000', message: "${JOB_NAME} - #${BUILD_NUMBER} Push frontend-deployment.yaml", teamDomain: 'k8sproject5', tokenCredentialId: 'kakaonibs-slack'
    }
 
    stage('[Update] plate-detection-deployment.yaml') {
      sh "rm -rf plate-detection-deployment.yaml"
      sh """
      cat <<EOF> plate-detection-deployment.yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: plate-detection
  namespace: default
spec:
  replicas: 3
  selector:
    matchLabels:
      app: plate-detection
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      labels:
        app: plate-detection
    spec:
      containers:
        - name: plate-detection
          image: 525348550799.dkr.ecr.ap-southeast-1.amazonaws.com/plate-detection:${imageTag}
          imagePullPolicy: Always
          ports:
            - containerPort: 8080
          env:
            - name: ACCOUNT_ID
              valueFrom:
                secretKeyRef:
                  name: aws-pass-secret
                  key: ACCOUNT_ID
            - name: ACCESS_KEY
              valueFrom:
                secretKeyRef:
                  name: aws-pass-secret
                  key: ACCESS_KEY
            - name: BUCKET_NAME
              valueFrom:
                secretKeyRef:
                  name: aws-pass-secret
                  key: BUCKET_NAME
      EOF
      """ 
      slackSend channel: '#cicd', color: '#FF0000', message: "${JOB_NAME} - #${BUILD_NUMBER} Push plate-detection-deployment.yaml", teamDomain: 'k8sproject5', tokenCredentialId: 'kakaonibs-slack'
    }
   
   stage('[Update] pose-estimation-deployment.yaml') {
      sh "rm -rf pose-estimation-deployment.yaml"
      sh """
      cat <<EOF> pose-estimation-deployment.yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: pose-estimation
  namespace: default
spec:
  replicas: 3
  selector:
    matchLabels:
      app: pose-estimation
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      labels:
        app: pose-estimation
    spec:
      containers:
        - name: pose-estimation
          image: 525348550799.dkr.ecr.ap-southeast-1.amazonaws.com/pose-estimation:${imageTag}
          imagePullPolicy: Always
          ports:
            - containerPort: 8080
          env:
            - name: ACCOUNT_ID
              valueFrom:
                secretKeyRef:
                  name: aws-pass-secret
                  key: ACCOUNT_ID
            - name: ACCESS_KEY
              valueFrom:
                secretKeyRef:
                  name: aws-pass-secret
                  key: ACCESS_KEY
            - name: BUCKET_NAME
              valueFrom:
                secretKeyRef:
                  name: aws-pass-secret
                  key: BUCKET_NAME
      EOF
      """
      slackSend channel: '#cicd', color: '#FF0000', message: "${JOB_NAME} - #${BUILD_NUMBER} Push pose-estimation-deployment.yaml", teamDomain: 'k8sproject5', tokenCredentialId: 'kakaonibs-slack'
    }
   stage('[Update] yolov5-detection-deployment.yaml') {
      sh "rm -rf yolov5-detection-deployment.yaml"
      sh """
      cat <<EOF> yolov5-detection-deployment.yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: yolov5-detection
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      app: yolov5-detection
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      labels:
        app: yolov5-detection
    spec:
      containers:
        - name: yolov5-detection
          image: 525348550799.dkr.ecr.ap-southeast-1.amazonaws.com/yolov5-detection:${imageTag}
          imagePullPolicy: Always
          ports:
            - containerPort: 8080
          env:
            - name: ACCOUNT_ID
              valueFrom:
                secretKeyRef:
                  name: aws-pass-secret
                  key:  ACCOUNT_ID
            - name: ACCESS_KEY
              valueFrom:
                secretKeyRef:
                  name: aws-pass-secret
                  key:  ACCESS_KEY
            - name: BUCKET_NAME
              valueFrom:
                secretKeyRef:
                  name: aws-pass-secret
                  key:  BUCKET_NAME
          readinessProbe:
            tcpSocket:
              port: 8080
            initialDelaySeconds: 30
            periodSeconds: 10
      terminationGracePeriodSeconds:  30
      EOF
      """
      slackSend channel: '#jenkins_noti', color: '#FF0000', message: "${JOB_NAME} - #${BUILD_NUMBER} Push yolov5-detection-deployment.yaml", teamDomain: 'k8sproject5', tokenCredentialId: 'kakaonibs-slack'
    }
   stage('[Push] Push to Gitops') {
    sh 'git checkout -b argocd'
    sh 'git add *'
    sh 'git commit -m "update"'
    sh "git push https://huhji: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@github.com/huhji/k8s-manifest-repo argocd"   
    slackSend channel: '#cicd', color: '#FF0000', message: "${JOB_NAME} - #${BUILD_NUMBER} Push to Gitops", teamDomain: 'k8sproject5', tokenCredentialId: 'kakaonibs-slack'
}
  } catch (error) {
    slackSend channel: '#cicd', color: '#FF0000', message: "${JOB_NAME} - #${BUILD_NUMBER} r", teamDomain: 'k8sproject5', tokenCredentialId: 'kakaonibs-slack'
  }
}
@NonCPS
def getLatestBuildNumber() {
    def jobname = "Jenkins_to_ECR"
    def job = Jenkins.instance.getItemByFullName(jobname)
    job.getLastBuild().getNumber()
}
