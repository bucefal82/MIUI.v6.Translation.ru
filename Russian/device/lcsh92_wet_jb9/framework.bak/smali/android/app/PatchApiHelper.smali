.class public Landroid/app/PatchApiHelper;
.super Ljava/lang/Object;
.source "PatchApiHelper.java"


# static fields
.field private static CLASS_RESOURCES_KEY:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private static HAS_IS_THEMEABLE:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/4 v3, 0x0

    const/4 v1, 0x0

    sput-boolean v1, Landroid/app/PatchApiHelper;->HAS_IS_THEMEABLE:Z

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-ge v1, v2, :cond_0

    const-string v1, "android.app.ActivityThread$ResourcesKey"

    invoke-static {v1, v3}, Lcom/kdeveloper/patchapi/Core;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    :goto_0
    sput-object v1, Landroid/app/PatchApiHelper;->CLASS_RESOURCES_KEY:Ljava/lang/Class;

    :try_start_0
    sget-object v1, Landroid/app/PatchApiHelper;->CLASS_RESOURCES_KEY:Ljava/lang/Class;

    const-string v2, "mIsThemeable"

    invoke-static {v1, v2}, Lcom/kdeveloper/patchapi/Core;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    const/4 v1, 0x1

    sput-boolean v1, Landroid/app/PatchApiHelper;->HAS_IS_THEMEABLE:Z
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    return-void

    :cond_0
    const-string v1, "android.content.res.ResourcesKey"

    invoke-static {v1, v3}, Lcom/kdeveloper/patchapi/Core;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/kdeveloper/patchapi/Core;->log(Ljava/lang/Throwable;)V

    goto :goto_1

    :catch_1
    move-exception v1

    goto :goto_1
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addActiveResource(Ljava/lang/String;FZLandroid/content/res/Resources;)V
    .locals 8

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {}, Landroid/app/ActivityThread;->currentActivityThread()Landroid/app/ActivityThread;

    move-result-object v7

    if-nez v7, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x10

    if-gt v0, v3, :cond_2

    invoke-static {p0, p1, p2}, Landroid/app/PatchApiHelper;->createResourcesKey(Ljava/lang/String;FZ)Ljava/lang/Object;

    move-result-object v6

    :goto_1
    if-eqz v6, :cond_0

    invoke-static {v7}, Landroid/app/PatchApiHelper;->getActiveResources(Landroid/app/ActivityThread;)Ljava/util/Map;

    move-result-object v0

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x12

    if-gt v0, v3, :cond_3

    invoke-static {p0, v1, v2, p1, p2}, Landroid/app/PatchApiHelper;->createResourcesKey(Ljava/lang/String;ILandroid/content/res/Configuration;FZ)Ljava/lang/Object;

    move-result-object v6

    goto :goto_1

    :cond_3
    move-object v0, p0

    move v3, p1

    move-object v4, v2

    move v5, p2

    invoke-static/range {v0 .. v5}, Landroid/app/PatchApiHelper;->createResourcesKey(Ljava/lang/String;ILandroid/content/res/Configuration;FLandroid/os/IBinder;Z)Ljava/lang/Object;

    move-result-object v6

    goto :goto_1
.end method

.method private static createResourcesKey(Ljava/lang/String;FZ)Ljava/lang/Object;
    .locals 5

    :try_start_0
    sget-boolean v1, Landroid/app/PatchApiHelper;->HAS_IS_THEMEABLE:Z

    if-eqz v1, :cond_0

    sget-object v1, Landroid/app/PatchApiHelper;->CLASS_RESOURCES_KEY:Ljava/lang/Class;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Lcom/kdeveloper/patchapi/Core;->newInstance(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    sget-object v1, Landroid/app/PatchApiHelper;->CLASS_RESOURCES_KEY:Ljava/lang/Class;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Lcom/kdeveloper/patchapi/Core;->newInstance(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/kdeveloper/patchapi/Core;->log(Ljava/lang/Throwable;)V

    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static createResourcesKey(Ljava/lang/String;ILandroid/content/res/Configuration;FLandroid/os/IBinder;Z)Ljava/lang/Object;
    .locals 5

    :try_start_0
    sget-boolean v1, Landroid/app/PatchApiHelper;->HAS_IS_THEMEABLE:Z

    if-eqz v1, :cond_0

    sget-object v1, Landroid/app/PatchApiHelper;->CLASS_RESOURCES_KEY:Ljava/lang/Class;

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    const/4 v3, 0x3

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x4

    invoke-static {p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x5

    aput-object p4, v2, v3

    invoke-static {v1, v2}, Lcom/kdeveloper/patchapi/Core;->newInstance(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    sget-object v1, Landroid/app/PatchApiHelper;->CLASS_RESOURCES_KEY:Ljava/lang/Class;

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    const/4 v3, 0x3

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x4

    aput-object p4, v2, v3

    invoke-static {v1, v2}, Lcom/kdeveloper/patchapi/Core;->newInstance(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/kdeveloper/patchapi/Core;->log(Ljava/lang/Throwable;)V

    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static createResourcesKey(Ljava/lang/String;ILandroid/content/res/Configuration;FZ)Ljava/lang/Object;
    .locals 5

    :try_start_0
    sget-boolean v1, Landroid/app/PatchApiHelper;->HAS_IS_THEMEABLE:Z

    if-eqz v1, :cond_0

    sget-object v1, Landroid/app/PatchApiHelper;->CLASS_RESOURCES_KEY:Ljava/lang/Class;

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    const/4 v3, 0x3

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x4

    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Lcom/kdeveloper/patchapi/Core;->newInstance(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    sget-object v1, Landroid/app/PatchApiHelper;->CLASS_RESOURCES_KEY:Ljava/lang/Class;

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    const/4 v3, 0x3

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Lcom/kdeveloper/patchapi/Core;->newInstance(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/kdeveloper/patchapi/Core;->log(Ljava/lang/Throwable;)V

    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static currentApplication()Landroid/app/Application;
    .locals 1

    invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;

    move-result-object v0

    return-object v0
.end method

.method public static currentApplicationInfo()Landroid/content/pm/ApplicationInfo;
    .locals 4

    const/4 v2, 0x0

    invoke-static {}, Landroid/app/ActivityThread;->currentActivityThread()Landroid/app/ActivityThread;

    move-result-object v0

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-object v2

    :cond_1
    const-string v3, "mBoundApplication"

    invoke-static {v0, v3}, Lcom/kdeveloper/patchapi/Core;->getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v2, "appInfo"

    invoke-static {v1, v2}, Lcom/kdeveloper/patchapi/Core;->getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/ApplicationInfo;

    goto :goto_0
.end method

.method public static currentPackageName()Ljava/lang/String;
    .locals 2

    invoke-static {}, Landroid/app/PatchApiHelper;->currentApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    :goto_0
    return-object v1

    :cond_0
    const-string v1, "android"

    goto :goto_0
.end method

.method public static currentProcessName()Ljava/lang/String;
    .locals 1

    invoke-static {}, Landroid/app/ActivityThread;->currentPackageName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "android"

    :cond_0
    return-object v0
.end method

.method private static getActiveResources(Landroid/app/ActivityThread;)Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/ActivityThread;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/content/res/Resources;",
            ">;>;"
        }
    .end annotation

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x12

    if-gt v1, v2, :cond_0

    const-string v1, "mActiveResources"

    invoke-static {p0, v1}, Lcom/kdeveloper/patchapi/Core;->getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    :goto_0
    return-object v1

    :cond_0
    const-string v1, "mResourcesManager"

    invoke-static {p0, v1}, Lcom/kdeveloper/patchapi/Core;->getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "mActiveResources"

    invoke-static {v0, v1}, Lcom/kdeveloper/patchapi/Core;->getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    goto :goto_0
.end method

.method public static getDefaultSharedPreferencesForPackage(Ljava/lang/String;)Landroid/content/SharedPreferences;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    new-instance v0, Lcom/kdeveloper/patchapi/Preferences;

    invoke-direct {v0, p0}, Lcom/kdeveloper/patchapi/Preferences;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static getSharedPreferencesForPackage(Ljava/lang/String;Ljava/lang/String;I)Landroid/content/SharedPreferences;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    new-instance v0, Lcom/kdeveloper/patchapi/Preferences;

    invoke-direct {v0, p0, p1}, Lcom/kdeveloper/patchapi/Preferences;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static reloadSharedPreferencesIfNeeded(Landroid/content/SharedPreferences;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    instance-of v0, p0, Lcom/kdeveloper/patchapi/Preferences;

    if-eqz v0, :cond_0

    check-cast p0, Lcom/kdeveloper/patchapi/Preferences;

    invoke-virtual {p0}, Lcom/kdeveloper/patchapi/Preferences;->reload()V

    :cond_0
    return-void
.end method
