.class Lcom/kdeveloper/patchapi/Preferences$1;
.super Ljava/lang/Thread;
.source "Preferences.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/kdeveloper/patchapi/Preferences;->startLoadFromDisk()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/kdeveloper/patchapi/Preferences;


# direct methods
.method constructor <init>(Lcom/kdeveloper/patchapi/Preferences;Ljava/lang/String;)V
    .locals 0
    .param p2, "$anonymous0"    # Ljava/lang/String;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/kdeveloper/patchapi/Preferences$1;->this$0:Lcom/kdeveloper/patchapi/Preferences;

    .line 62
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 65
    iget-object v1, p0, Lcom/kdeveloper/patchapi/Preferences$1;->this$0:Lcom/kdeveloper/patchapi/Preferences;

    monitor-enter v1

    .line 66
    :try_start_0
    iget-object v0, p0, Lcom/kdeveloper/patchapi/Preferences$1;->this$0:Lcom/kdeveloper/patchapi/Preferences;

    # invokes: Lcom/kdeveloper/patchapi/Preferences;->loadFromDiskLocked()V
    invoke-static {v0}, Lcom/kdeveloper/patchapi/Preferences;->access$0(Lcom/kdeveloper/patchapi/Preferences;)V

    .line 65
    monitor-exit v1

    .line 68
    return-void

    .line 65
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
