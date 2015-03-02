.class public Lcom/kdeveloper/patchapi/Preferences;
.super Ljava/lang/Object;
.source "Preferences.java"

# interfaces
.implements Landroid/content/SharedPreferences;


# static fields
.field private static final TAG:Ljava/lang/String; = "ReadOnlySharedPreferences"


# instance fields
.field private final mFile:Ljava/io/File;

.field private mFileSize:J

.field private mLastModified:J

.field private mLoaded:Z

.field private mMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .param p1, "prefFile"    # Ljava/io/File;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/kdeveloper/patchapi/Preferences;->mLoaded:Z

    .line 30
    iput-object p1, p0, Lcom/kdeveloper/patchapi/Preferences;->mFile:Ljava/io/File;

    .line 31
    invoke-direct {p0}, Lcom/kdeveloper/patchapi/Preferences;->startLoadFromDisk()V

    .line 32
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "_preferences"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/kdeveloper/patchapi/Preferences;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "prefFileName"    # Ljava/lang/String;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/kdeveloper/patchapi/Preferences;->mLoaded:Z

    .line 39
    new-instance v0, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "data/"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/shared_prefs/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".xml"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/kdeveloper/patchapi/Preferences;->mFile:Ljava/io/File;

    .line 40
    invoke-direct {p0}, Lcom/kdeveloper/patchapi/Preferences;->startLoadFromDisk()V

    .line 41
    return-void
.end method

.method static synthetic access$0(Lcom/kdeveloper/patchapi/Preferences;)V
    .locals 0

    .prologue
    .line 73
    invoke-direct {p0}, Lcom/kdeveloper/patchapi/Preferences;->loadFromDiskLocked()V

    return-void
.end method

.method private awaitLoadedLocked()V
    .locals 1

    .prologue
    .line 139
    :goto_0
    iget-boolean v0, p0, Lcom/kdeveloper/patchapi/Preferences;->mLoaded:Z

    if-eqz v0, :cond_0

    .line 145
    return-void

    .line 141
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 142
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private loadFromDiskLocked()V
    .locals 11

    .prologue
    .line 74
    iget-boolean v9, p0, Lcom/kdeveloper/patchapi/Preferences;->mLoaded:Z

    if-eqz v9, :cond_0

    .line 114
    :goto_0
    return-void

    .line 78
    :cond_0
    const/4 v5, 0x0

    .line 79
    .local v5, "map":Ljava/util/Map;
    const-wide/16 v3, 0x0

    .line 80
    .local v3, "lastModified":J
    const-wide/16 v1, 0x0

    .line 81
    .local v1, "fileSize":J
    iget-object v9, p0, Lcom/kdeveloper/patchapi/Preferences;->mFile:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->canRead()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 82
    iget-object v9, p0, Lcom/kdeveloper/patchapi/Preferences;->mFile:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->lastModified()J

    move-result-wide v3

    .line 83
    iget-object v9, p0, Lcom/kdeveloper/patchapi/Preferences;->mFile:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->length()J

    move-result-wide v1

    .line 84
    const/4 v7, 0x0

    .line 86
    .local v7, "str":Ljava/io/BufferedInputStream;
    :try_start_0
    new-instance v8, Ljava/io/BufferedInputStream;

    .line 87
    new-instance v9, Ljava/io/FileInputStream;

    iget-object v10, p0, Lcom/kdeveloper/patchapi/Preferences;->mFile:Ljava/io/File;

    invoke-direct {v9, v10}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const/16 v10, 0x4000

    .line 86
    invoke-direct {v8, v9, v10}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    .end local v7    # "str":Ljava/io/BufferedInputStream;
    .local v8, "str":Ljava/io/BufferedInputStream;
    :try_start_1
    invoke-static {v8}, Lcom/android/internal/util/XmlUtils;->readMapXml(Ljava/io/InputStream;)Ljava/util/HashMap;

    move-result-object v5

    .line 89
    invoke-virtual {v8}, Ljava/io/BufferedInputStream;->close()V
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_b
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_a
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 95
    if-eqz v8, :cond_1

    .line 97
    :try_start_2
    invoke-virtual {v8}, Ljava/io/BufferedInputStream;->close()V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_9

    .line 105
    .end local v8    # "str":Ljava/io/BufferedInputStream;
    :cond_1
    :goto_1
    const/4 v9, 0x1

    iput-boolean v9, p0, Lcom/kdeveloper/patchapi/Preferences;->mLoaded:Z

    .line 106
    if-eqz v5, :cond_3

    .line 107
    iput-object v5, p0, Lcom/kdeveloper/patchapi/Preferences;->mMap:Ljava/util/Map;

    .line 108
    iput-wide v3, p0, Lcom/kdeveloper/patchapi/Preferences;->mLastModified:J

    .line 109
    iput-wide v1, p0, Lcom/kdeveloper/patchapi/Preferences;->mFileSize:J

    .line 113
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    goto :goto_0

    .line 90
    .restart local v7    # "str":Ljava/io/BufferedInputStream;
    :catch_0
    move-exception v0

    .line 91
    .local v0, "e":Lorg/xmlpull/v1/XmlPullParserException;
    :goto_3
    :try_start_3
    const-string v9, "ReadOnlySharedPreferences"

    const-string v10, "getSharedPreferences"

    invoke-static {v9, v10, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 95
    if-eqz v7, :cond_1

    .line 97
    :try_start_4
    invoke-virtual {v7}, Ljava/io/BufferedInputStream;->close()V
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_6

    goto :goto_1

    .line 98
    :catch_1
    move-exception v6

    .line 99
    .local v6, "rethrown":Ljava/lang/RuntimeException;
    throw v6

    .line 92
    .end local v0    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    .end local v6    # "rethrown":Ljava/lang/RuntimeException;
    :catch_2
    move-exception v0

    .line 93
    .local v0, "e":Ljava/io/IOException;
    :goto_4
    :try_start_5
    const-string v9, "ReadOnlySharedPreferences"

    const-string v10, "getSharedPreferences"

    invoke-static {v9, v10, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 95
    if-eqz v7, :cond_1

    .line 97
    :try_start_6
    invoke-virtual {v7}, Ljava/io/BufferedInputStream;->close()V
    :try_end_6
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_3
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_7

    goto :goto_1

    .line 98
    :catch_3
    move-exception v6

    .line 99
    .restart local v6    # "rethrown":Ljava/lang/RuntimeException;
    throw v6

    .line 94
    .end local v0    # "e":Ljava/io/IOException;
    .end local v6    # "rethrown":Ljava/lang/RuntimeException;
    :catchall_0
    move-exception v9

    .line 95
    :goto_5
    if-eqz v7, :cond_2

    .line 97
    :try_start_7
    invoke-virtual {v7}, Ljava/io/BufferedInputStream;->close()V
    :try_end_7
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_7} :catch_4
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_8

    .line 103
    :cond_2
    :goto_6
    throw v9

    .line 98
    :catch_4
    move-exception v6

    .line 99
    .restart local v6    # "rethrown":Ljava/lang/RuntimeException;
    throw v6

    .line 98
    .end local v6    # "rethrown":Ljava/lang/RuntimeException;
    .end local v7    # "str":Ljava/io/BufferedInputStream;
    .restart local v8    # "str":Ljava/io/BufferedInputStream;
    :catch_5
    move-exception v6

    .line 99
    .restart local v6    # "rethrown":Ljava/lang/RuntimeException;
    throw v6

    .line 111
    .end local v6    # "rethrown":Ljava/lang/RuntimeException;
    .end local v8    # "str":Ljava/io/BufferedInputStream;
    :cond_3
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    iput-object v9, p0, Lcom/kdeveloper/patchapi/Preferences;->mMap:Ljava/util/Map;

    goto :goto_2

    .line 100
    .local v0, "e":Lorg/xmlpull/v1/XmlPullParserException;
    .restart local v7    # "str":Ljava/io/BufferedInputStream;
    :catch_6
    move-exception v9

    goto :goto_1

    .local v0, "e":Ljava/io/IOException;
    :catch_7
    move-exception v9

    goto :goto_1

    .end local v0    # "e":Ljava/io/IOException;
    :catch_8
    move-exception v10

    goto :goto_6

    .end local v7    # "str":Ljava/io/BufferedInputStream;
    .restart local v8    # "str":Ljava/io/BufferedInputStream;
    :catch_9
    move-exception v9

    goto :goto_1

    .line 94
    :catchall_1
    move-exception v9

    move-object v7, v8

    .end local v8    # "str":Ljava/io/BufferedInputStream;
    .restart local v7    # "str":Ljava/io/BufferedInputStream;
    goto :goto_5

    .line 92
    .end local v7    # "str":Ljava/io/BufferedInputStream;
    .restart local v8    # "str":Ljava/io/BufferedInputStream;
    :catch_a
    move-exception v0

    move-object v7, v8

    .end local v8    # "str":Ljava/io/BufferedInputStream;
    .restart local v7    # "str":Ljava/io/BufferedInputStream;
    goto :goto_4

    .line 90
    .end local v7    # "str":Ljava/io/BufferedInputStream;
    .restart local v8    # "str":Ljava/io/BufferedInputStream;
    :catch_b
    move-exception v0

    move-object v7, v8

    .end local v8    # "str":Ljava/io/BufferedInputStream;
    .restart local v7    # "str":Ljava/io/BufferedInputStream;
    goto :goto_3
.end method

.method private startLoadFromDisk()V
    .locals 2

    .prologue
    .line 59
    monitor-enter p0

    .line 60
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/kdeveloper/patchapi/Preferences;->mLoaded:Z

    .line 59
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    new-instance v0, Lcom/kdeveloper/patchapi/Preferences$1;

    const-string v1, "PatchAPI-Preferences-Load"

    invoke-direct {v0, p0, v1}, Lcom/kdeveloper/patchapi/Preferences$1;-><init>(Lcom/kdeveloper/patchapi/Preferences;Ljava/lang/String;)V

    .line 69
    invoke-virtual {v0}, Lcom/kdeveloper/patchapi/Preferences$1;->start()V

    .line 70
    return-void

    .line 59
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method public contains(Ljava/lang/String;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 212
    monitor-enter p0

    .line 213
    :try_start_0
    invoke-direct {p0}, Lcom/kdeveloper/patchapi/Preferences;->awaitLoadedLocked()V

    .line 214
    iget-object v0, p0, Lcom/kdeveloper/patchapi/Preferences;->mMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    monitor-exit p0

    return v0

    .line 212
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public edit()Landroid/content/SharedPreferences$Editor;
    .locals 2

    .prologue
    .line 220
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "read-only implementation"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAll()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "*>;"
        }
    .end annotation

    .prologue
    .line 149
    monitor-enter p0

    .line 150
    :try_start_0
    invoke-direct {p0}, Lcom/kdeveloper/patchapi/Preferences;->awaitLoadedLocked()V

    .line 151
    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p0, Lcom/kdeveloper/patchapi/Preferences;->mMap:Ljava/util/Map;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    monitor-exit p0

    return-object v0

    .line 149
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getBoolean(Ljava/lang/String;Z)Z
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defValue"    # Z

    .prologue
    .line 203
    monitor-enter p0

    .line 204
    :try_start_0
    invoke-direct {p0}, Lcom/kdeveloper/patchapi/Preferences;->awaitLoadedLocked()V

    .line 205
    iget-object v1, p0, Lcom/kdeveloper/patchapi/Preferences;->mMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 206
    .local v0, "v":Ljava/lang/Boolean;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    .end local p2    # "defValue":Z
    :cond_0
    monitor-exit p0

    return p2

    .line 203
    .end local v0    # "v":Ljava/lang/Boolean;
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/kdeveloper/patchapi/Preferences;->mFile:Ljava/io/File;

    return-object v0
.end method

.method public getFloat(Ljava/lang/String;F)F
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defValue"    # F

    .prologue
    .line 194
    monitor-enter p0

    .line 195
    :try_start_0
    invoke-direct {p0}, Lcom/kdeveloper/patchapi/Preferences;->awaitLoadedLocked()V

    .line 196
    iget-object v1, p0, Lcom/kdeveloper/patchapi/Preferences;->mMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    .line 197
    .local v0, "v":Ljava/lang/Float;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result p2

    .end local p2    # "defValue":F
    :cond_0
    monitor-exit p0

    return p2

    .line 194
    .end local v0    # "v":Ljava/lang/Float;
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getInt(Ljava/lang/String;I)I
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defValue"    # I

    .prologue
    .line 176
    monitor-enter p0

    .line 177
    :try_start_0
    invoke-direct {p0}, Lcom/kdeveloper/patchapi/Preferences;->awaitLoadedLocked()V

    .line 178
    iget-object v1, p0, Lcom/kdeveloper/patchapi/Preferences;->mMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 179
    .local v0, "v":Ljava/lang/Integer;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p2

    .end local p2    # "defValue":I
    :cond_0
    monitor-exit p0

    return p2

    .line 176
    .end local v0    # "v":Ljava/lang/Integer;
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getLong(Ljava/lang/String;J)J
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defValue"    # J

    .prologue
    .line 185
    monitor-enter p0

    .line 186
    :try_start_0
    invoke-direct {p0}, Lcom/kdeveloper/patchapi/Preferences;->awaitLoadedLocked()V

    .line 187
    iget-object v1, p0, Lcom/kdeveloper/patchapi/Preferences;->mMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 188
    .local v0, "v":Ljava/lang/Long;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide p2

    .end local p2    # "defValue":J
    :cond_0
    monitor-exit p0

    return-wide p2

    .line 185
    .end local v0    # "v":Ljava/lang/Long;
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defValue"    # Ljava/lang/String;

    .prologue
    .line 157
    monitor-enter p0

    .line 158
    :try_start_0
    invoke-direct {p0}, Lcom/kdeveloper/patchapi/Preferences;->awaitLoadedLocked()V

    .line 159
    iget-object v1, p0, Lcom/kdeveloper/patchapi/Preferences;->mMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 160
    .local v0, "v":Ljava/lang/String;
    if-eqz v0, :cond_0

    .end local v0    # "v":Ljava/lang/String;
    :goto_0
    monitor-exit p0

    return-object v0

    .restart local v0    # "v":Ljava/lang/String;
    :cond_0
    move-object v0, p2

    goto :goto_0

    .line 157
    .end local v0    # "v":Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 167
    .local p2, "defValues":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    monitor-enter p0

    .line 168
    :try_start_0
    invoke-direct {p0}, Lcom/kdeveloper/patchapi/Preferences;->awaitLoadedLocked()V

    .line 169
    iget-object v1, p0, Lcom/kdeveloper/patchapi/Preferences;->mMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 170
    .local v0, "v":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-eqz v0, :cond_0

    .end local v0    # "v":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :goto_0
    monitor-exit p0

    return-object v0

    .restart local v0    # "v":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_0
    move-object v0, p2

    goto :goto_0

    .line 167
    .end local v0    # "v":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public declared-synchronized hasFileChanged()Z
    .locals 7

    .prologue
    const/4 v4, 0x1

    .line 130
    monitor-enter p0

    :try_start_0
    iget-object v5, p0, Lcom/kdeveloper/patchapi/Preferences;->mFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->canRead()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v5

    if-nez v5, :cond_1

    .line 135
    :cond_0
    :goto_0
    monitor-exit p0

    return v4

    .line 133
    :cond_1
    :try_start_1
    iget-object v5, p0, Lcom/kdeveloper/patchapi/Preferences;->mFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    .line 134
    .local v2, "lastModified":J
    iget-object v5, p0, Lcom/kdeveloper/patchapi/Preferences;->mFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v0

    .line 135
    .local v0, "fileSize":J
    iget-wide v5, p0, Lcom/kdeveloper/patchapi/Preferences;->mLastModified:J

    cmp-long v5, v5, v2

    if-nez v5, :cond_0

    iget-wide v5, p0, Lcom/kdeveloper/patchapi/Preferences;->mFileSize:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    cmp-long v5, v5, v0

    if-nez v5, :cond_0

    const/4 v4, 0x0

    goto :goto_0

    .line 130
    .end local v0    # "fileSize":J
    .end local v2    # "lastModified":J
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public makeWorldReadable()Z
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 45
    iget-object v1, p0, Lcom/kdeveloper/patchapi/Preferences;->mFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 48
    :goto_0
    return v0

    :cond_0
    iget-object v1, p0, Lcom/kdeveloper/patchapi/Preferences;->mFile:Ljava/io/File;

    const/4 v2, 0x1

    invoke-virtual {v1, v2, v0}, Ljava/io/File;->setReadable(ZZ)Z

    move-result v0

    goto :goto_0
.end method

.method public registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V
    .locals 2
    .param p1, "listener"    # Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    .prologue
    .line 225
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "listeners are not supported in this implementation"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public reload()V
    .locals 1

    .prologue
    .line 120
    monitor-enter p0

    .line 121
    :try_start_0
    invoke-virtual {p0}, Lcom/kdeveloper/patchapi/Preferences;->hasFileChanged()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 122
    invoke-direct {p0}, Lcom/kdeveloper/patchapi/Preferences;->startLoadFromDisk()V

    .line 120
    :cond_0
    monitor-exit p0

    .line 124
    return-void

    .line 120
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V
    .locals 2
    .param p1, "listener"    # Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    .prologue
    .line 230
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "listeners are not supported in this implementation"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
