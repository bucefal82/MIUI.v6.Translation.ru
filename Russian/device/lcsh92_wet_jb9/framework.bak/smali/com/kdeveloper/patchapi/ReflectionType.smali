.class public final enum Lcom/kdeveloper/patchapi/ReflectionType;
.super Ljava/lang/Enum;
.source "ReflectionType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/kdeveloper/patchapi/ReflectionType;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum AFTER:Lcom/kdeveloper/patchapi/ReflectionType;

.field public static final enum BEFORE:Lcom/kdeveloper/patchapi/ReflectionType;

.field private static final synthetic ENUM$VALUES:[Lcom/kdeveloper/patchapi/ReflectionType;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 5
    new-instance v0, Lcom/kdeveloper/patchapi/ReflectionType;

    const-string v1, "BEFORE"

    invoke-direct {v0, v1, v2}, Lcom/kdeveloper/patchapi/ReflectionType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/kdeveloper/patchapi/ReflectionType;->BEFORE:Lcom/kdeveloper/patchapi/ReflectionType;

    .line 6
    new-instance v0, Lcom/kdeveloper/patchapi/ReflectionType;

    const-string v1, "AFTER"

    invoke-direct {v0, v1, v3}, Lcom/kdeveloper/patchapi/ReflectionType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/kdeveloper/patchapi/ReflectionType;->AFTER:Lcom/kdeveloper/patchapi/ReflectionType;

    .line 3
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/kdeveloper/patchapi/ReflectionType;

    sget-object v1, Lcom/kdeveloper/patchapi/ReflectionType;->BEFORE:Lcom/kdeveloper/patchapi/ReflectionType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/kdeveloper/patchapi/ReflectionType;->AFTER:Lcom/kdeveloper/patchapi/ReflectionType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/kdeveloper/patchapi/ReflectionType;->ENUM$VALUES:[Lcom/kdeveloper/patchapi/ReflectionType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/kdeveloper/patchapi/ReflectionType;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/kdeveloper/patchapi/ReflectionType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/kdeveloper/patchapi/ReflectionType;

    return-object v0
.end method

.method public static values()[Lcom/kdeveloper/patchapi/ReflectionType;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/kdeveloper/patchapi/ReflectionType;->ENUM$VALUES:[Lcom/kdeveloper/patchapi/ReflectionType;

    array-length v1, v0

    new-array v2, v1, [Lcom/kdeveloper/patchapi/ReflectionType;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
