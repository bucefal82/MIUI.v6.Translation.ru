.class public Lcom/kdeveloper/patchapi/AccessReflector;
.super Ljava/lang/Object;
.source "AccessReflector.java"


# static fields
.field public static final API_BASE_DIR:Ljava/lang/String; = "/system/framework/patchapi/"

.field public static final API_DATA_DIR:Ljava/lang/String; = "/data/system/patchapi/"

.field public static final BOOTCLASSLOADER:Ljava/lang/ClassLoader;

.field private static disableHooks:Z

.field private static refs:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/kdeveloper/patchapi/IReflection;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 20
    sput-object v0, Lcom/kdeveloper/patchapi/AccessReflector;->BOOTCLASSLOADER:Ljava/lang/ClassLoader;

    .line 22
    const/4 v0, 0x0

    sput-boolean v0, Lcom/kdeveloper/patchapi/AccessReflector;->disableHooks:Z

    .line 23
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/kdeveloper/patchapi/AccessReflector;->refs:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static loadModule(Ljava/lang/String;)V
    .locals 10
    .param p0, "apk"    # Ljava/lang/String;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 70
    sget-object v8, Lcom/kdeveloper/patchapi/AccessReflector;->refs:Ljava/util/HashMap;

    invoke-virtual {v8, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 116
    :goto_0
    return-void

    .line 72
    :cond_0
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Loading modules from "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/kdeveloper/patchapi/Core;->log(Ljava/lang/String;)V

    .line 73
    new-instance v8, Ljava/io/File;

    invoke-direct {v8, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_1

    .line 74
    const-string v8, "  File does not exist"

    invoke-static {v8}, Lcom/kdeveloper/patchapi/Core;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 78
    :cond_1
    new-instance v2, Ldalvik/system/PathClassLoader;

    sget-object v8, Lcom/kdeveloper/patchapi/AccessReflector;->BOOTCLASSLOADER:Ljava/lang/ClassLoader;

    invoke-direct {v2, p0, v8}, Ldalvik/system/PathClassLoader;-><init>(Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 79
    .local v2, "mcl":Ljava/lang/ClassLoader;
    const-string v8, "assets/init"

    invoke-virtual {v2, v8}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 80
    .local v1, "is":Ljava/io/InputStream;
    if-nez v1, :cond_2

    .line 81
    const-string v8, "assets/init not found in the APK"

    invoke-static {v8}, Lcom/kdeveloper/patchapi/Core;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 84
    :cond_2
    new-instance v5, Ljava/io/BufferedReader;

    .line 85
    new-instance v8, Ljava/io/InputStreamReader;

    invoke-direct {v8, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 84
    invoke-direct {v5, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 88
    .local v5, "moduleClassesReader":Ljava/io/BufferedReader;
    :cond_3
    :goto_1
    :try_start_0
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v4

    .local v4, "moduleClassName":Ljava/lang/String;
    if-nez v4, :cond_4

    .line 112
    :try_start_1
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 113
    :catch_0
    move-exception v8

    goto :goto_0

    .line 89
    :cond_4
    :try_start_2
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 90
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_3

    .line 91
    const-string v8, "#"

    invoke-virtual {v4, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v8

    if-nez v8, :cond_3

    .line 94
    :try_start_3
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "  Loading class "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/kdeveloper/patchapi/Core;->log(Ljava/lang/String;)V

    .line 95
    invoke-virtual {v2, v4}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 96
    .local v3, "moduleClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v8, Lcom/kdeveloper/patchapi/IReflection;

    invoke-virtual {v8, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-nez v8, :cond_5

    .line 97
    const-string v8, "    This class doesn\'t implement any sub-interface of IReflection, skipping it"

    invoke-static {v8}, Lcom/kdeveloper/patchapi/Core;->log(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 104
    .end local v3    # "moduleClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_1
    move-exception v7

    .line 105
    .local v7, "t":Ljava/lang/Throwable;
    :try_start_4
    invoke-static {v7}, Lcom/kdeveloper/patchapi/Core;->log(Ljava/lang/Throwable;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 108
    .end local v4    # "moduleClassName":Ljava/lang/String;
    .end local v7    # "t":Ljava/lang/Throwable;
    :catch_2
    move-exception v0

    .line 109
    .local v0, "e":Ljava/io/IOException;
    :try_start_5
    invoke-static {v0}, Lcom/kdeveloper/patchapi/Core;->log(Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 112
    :try_start_6
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    goto/16 :goto_0

    .line 113
    :catch_3
    move-exception v8

    goto/16 :goto_0

    .line 100
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v3    # "moduleClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v4    # "moduleClassName":Ljava/lang/String;
    :cond_5
    :try_start_7
    invoke-virtual {v3}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v6

    .line 101
    .local v6, "moduleInstance":Ljava/lang/Object;
    instance-of v8, v6, Lcom/kdeveloper/patchapi/IReflection;

    if-eqz v8, :cond_3

    .line 102
    sget-object v8, Lcom/kdeveloper/patchapi/AccessReflector;->refs:Ljava/util/HashMap;

    check-cast v6, Lcom/kdeveloper/patchapi/IReflection;

    .end local v6    # "moduleInstance":Ljava/lang/Object;
    invoke-virtual {v8, p0, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_1
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_1

    .line 110
    .end local v3    # "moduleClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "moduleClassName":Ljava/lang/String;
    :catchall_0
    move-exception v8

    .line 112
    :try_start_8
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4

    .line 115
    :goto_2
    throw v8

    .line 113
    :catch_4
    move-exception v9

    goto :goto_2
.end method

.method public static loadModules()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 49
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/FileReader;

    const-string v4, "/system/framework/patchapi/modules.list"

    invoke-direct {v3, v4}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 51
    .local v1, "apks":Ljava/io/BufferedReader;
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .local v0, "apk":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 54
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 56
    new-instance v2, Ljava/io/File;

    const-string v3, "/data/system/patchapi/modules.list"

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 57
    .local v2, "dataDir":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 58
    new-instance v1, Ljava/io/BufferedReader;

    .end local v1    # "apks":Ljava/io/BufferedReader;
    new-instance v3, Ljava/io/FileReader;

    const-string v4, "/data/system/patchapi/modules.list"

    invoke-direct {v3, v4}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 60
    .restart local v1    # "apks":Ljava/io/BufferedReader;
    :goto_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    .line 63
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 65
    :cond_0
    return-void

    .line 52
    .end local v2    # "dataDir":Ljava/io/File;
    :cond_1
    invoke-static {v0}, Lcom/kdeveloper/patchapi/AccessReflector;->loadModule(Ljava/lang/String;)V

    goto :goto_0

    .line 61
    .restart local v2    # "dataDir":Ljava/io/File;
    :cond_2
    invoke-static {v0}, Lcom/kdeveloper/patchapi/AccessReflector;->loadModule(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public static run(Ljava/lang/String;Lcom/kdeveloper/patchapi/ReflectionType;Ljava/lang/Object;)V
    .locals 4
    .param p0, "access_id"    # Ljava/lang/String;
    .param p1, "rt"    # Lcom/kdeveloper/patchapi/ReflectionType;
    .param p2, "thisObject"    # Ljava/lang/Object;

    .prologue
    .line 32
    sget-boolean v2, Lcom/kdeveloper/patchapi/AccessReflector;->disableHooks:Z

    if-eqz v2, :cond_1

    .line 46
    :cond_0
    :goto_0
    return-void

    .line 36
    :cond_1
    :try_start_0
    invoke-static {}, Lcom/kdeveloper/patchapi/AccessReflector;->loadModules()V

    .line 37
    sget-object v2, Lcom/kdeveloper/patchapi/AccessReflector;->refs:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/kdeveloper/patchapi/IReflection;

    .line 38
    .local v0, "ref":Lcom/kdeveloper/patchapi/IReflection;
    invoke-interface {v0, p0}, Lcom/kdeveloper/patchapi/IReflection;->getType(Ljava/lang/String;)Lcom/kdeveloper/patchapi/ReflectionType;

    move-result-object v3

    invoke-virtual {p1, v3}, Lcom/kdeveloper/patchapi/ReflectionType;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 39
    invoke-interface {v0, p0, p2}, Lcom/kdeveloper/patchapi/IReflection;->run(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 41
    .end local v0    # "ref":Lcom/kdeveloper/patchapi/IReflection;
    :catch_0
    move-exception v1

    .line 42
    .local v1, "t":Ljava/lang/Throwable;
    const-string v2, "Errors during PatchAPI initialization"

    invoke-static {v2}, Lcom/kdeveloper/patchapi/Core;->log(Ljava/lang/String;)V

    .line 43
    invoke-static {v1}, Lcom/kdeveloper/patchapi/Core;->log(Ljava/lang/Throwable;)V

    .line 44
    const/4 v2, 0x1

    sput-boolean v2, Lcom/kdeveloper/patchapi/AccessReflector;->disableHooks:Z

    goto :goto_0
.end method

.method public static switchState()Z
    .locals 1

    .prologue
    .line 26
    sget-boolean v0, Lcom/kdeveloper/patchapi/AccessReflector;->disableHooks:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    sput-boolean v0, Lcom/kdeveloper/patchapi/AccessReflector;->disableHooks:Z

    .line 27
    sget-boolean v0, Lcom/kdeveloper/patchapi/AccessReflector;->disableHooks:Z

    return v0

    .line 26
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method
