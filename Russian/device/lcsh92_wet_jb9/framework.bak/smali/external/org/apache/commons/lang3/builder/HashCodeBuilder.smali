.class public Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;
.super Ljava/lang/Object;
.source "HashCodeBuilder.java"

# interfaces
.implements Lexternal/org/apache/commons/lang3/builder/Builder;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lexternal/org/apache/commons/lang3/builder/Builder",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# static fields
.field private static final REGISTRY:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/util/Set",
            "<",
            "Lexternal/org/apache/commons/lang3/builder/IDKey;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private final iConstant:I

.field private iTotal:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->REGISTRY:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    const/16 v0, 0x25

    iput v0, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iConstant:I

    const/16 v0, 0x11

    iput v0, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    return-void
.end method

.method public constructor <init>(II)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HashCodeBuilder requires a non zero initial value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    rem-int/lit8 v0, p1, 0x2

    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HashCodeBuilder requires an odd initial value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    if-nez p2, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HashCodeBuilder requires a non zero multiplier"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    rem-int/lit8 v0, p2, 0x2

    if-nez v0, :cond_3

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HashCodeBuilder requires an odd multiplier"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    iput p2, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iConstant:I

    iput p1, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    return-void
.end method

.method static getRegistry()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lexternal/org/apache/commons/lang3/builder/IDKey;",
            ">;"
        }
    .end annotation

    sget-object v0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->REGISTRY:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    return-object v0
.end method

.method static isRegistered(Ljava/lang/Object;)Z
    .locals 2

    invoke-static {}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->getRegistry()Ljava/util/Set;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Lexternal/org/apache/commons/lang3/builder/IDKey;

    invoke-direct {v1, p0}, Lexternal/org/apache/commons/lang3/builder/IDKey;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static reflectionAppend(Ljava/lang/Object;Ljava/lang/Class;Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;Z[Ljava/lang/String;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;",
            "Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;",
            "Z[",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-static {p0}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->isRegistered(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    :goto_0
    return-void

    :cond_0
    :try_start_0
    invoke-static {p0}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->register(Ljava/lang/Object;)V

    invoke-virtual {p1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v3

    const/4 v4, 0x1

    invoke-static {v3, v4}, Ljava/lang/reflect/AccessibleObject;->setAccessible([Ljava/lang/reflect/AccessibleObject;Z)V

    array-length v5, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v4, 0x0

    :goto_1
    if-lt v4, v5, :cond_1

    invoke-static {p0}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->unregister(Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    :try_start_1
    aget-object v1, v3, v4

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {p4, v6}, Lexternal/org/apache/commons/lang3/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0x24

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    const/4 v7, -0x1

    if-ne v6, v7, :cond_3

    if-nez p3, :cond_2

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v6

    invoke-static {v6}, Ljava/lang/reflect/Modifier;->isTransient(I)Z

    move-result v6

    if-nez v6, :cond_3

    :cond_2
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v6

    invoke-static {v6}, Ljava/lang/reflect/Modifier;->isStatic(I)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v6

    if-nez v6, :cond_3

    :try_start_2
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p2, v2}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->append(Ljava/lang/Object;)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;
    :try_end_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_3
    new-instance v4, Ljava/lang/InternalError;

    const-string v5, "Unexpected IllegalAccessException"

    invoke-direct {v4, v5}, Ljava/lang/InternalError;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catchall_0
    move-exception v4

    invoke-static {p0}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->unregister(Ljava/lang/Object;)V

    throw v4
.end method

.method public static reflectionHashCode(IILjava/lang/Object;)I
    .locals 6

    const/4 v3, 0x0

    const/4 v4, 0x0

    new-array v5, v3, [Ljava/lang/String;

    move v0, p0

    move v1, p1

    move-object v2, p2

    invoke-static/range {v0 .. v5}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->reflectionHashCode(IILjava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static reflectionHashCode(IILjava/lang/Object;Z)I
    .locals 6

    const/4 v4, 0x0

    const/4 v0, 0x0

    new-array v5, v0, [Ljava/lang/String;

    move v0, p0

    move v1, p1

    move-object v2, p2

    move v3, p3

    invoke-static/range {v0 .. v5}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->reflectionHashCode(IILjava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static varargs reflectionHashCode(IILjava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(IITT;Z",
            "Ljava/lang/Class",
            "<-TT;>;[",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    if-nez p2, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The object to build a hash code for must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_0
    new-instance v0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;

    invoke-direct {v0, p0, p1}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;-><init>(II)V

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {p2, v1, v0, p3, p5}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->reflectionAppend(Ljava/lang/Object;Ljava/lang/Class;Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;Z[Ljava/lang/String;)V

    :goto_0
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v2

    if-eqz v2, :cond_1

    if-ne v1, p4, :cond_2

    :cond_1
    invoke-virtual {v0}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->toHashCode()I

    move-result v2

    return v2

    :cond_2
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {p2, v1, v0, p3, p5}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->reflectionAppend(Ljava/lang/Object;Ljava/lang/Class;Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;Z[Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static reflectionHashCode(Ljava/lang/Object;Ljava/util/Collection;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    invoke-static {p1}, Lexternal/org/apache/commons/lang3/builder/ReflectionToStringBuilder;->toNoNullStringArray(Ljava/util/Collection;)[Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->reflectionHashCode(Ljava/lang/Object;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static reflectionHashCode(Ljava/lang/Object;Z)I
    .locals 6

    const/16 v0, 0x11

    const/16 v1, 0x25

    const/4 v4, 0x0

    const/4 v2, 0x0

    new-array v5, v2, [Ljava/lang/String;

    move-object v2, p0

    move v3, p1

    invoke-static/range {v0 .. v5}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->reflectionHashCode(IILjava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static varargs reflectionHashCode(Ljava/lang/Object;[Ljava/lang/String;)I
    .locals 6

    const/16 v0, 0x11

    const/16 v1, 0x25

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v2, p0

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->reflectionHashCode(IILjava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static register(Ljava/lang/Object;)V
    .locals 3

    const-class v1, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;

    monitor-enter v1

    :try_start_0
    invoke-static {}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->getRegistry()Ljava/util/Set;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object v0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->REGISTRY:Ljava/lang/ThreadLocal;

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->getRegistry()Ljava/util/Set;

    move-result-object v0

    new-instance v1, Lexternal/org/apache/commons/lang3/builder/IDKey;

    invoke-direct {v1, p0}, Lexternal/org/apache/commons/lang3/builder/IDKey;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method static unregister(Ljava/lang/Object;)V
    .locals 3

    invoke-static {}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->getRegistry()Ljava/util/Set;

    move-result-object v0

    if-eqz v0, :cond_1

    new-instance v1, Lexternal/org/apache/commons/lang3/builder/IDKey;

    invoke-direct {v1, p0}, Lexternal/org/apache/commons/lang3/builder/IDKey;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    const-class v2, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;

    monitor-enter v2

    :try_start_0
    invoke-static {}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->getRegistry()Ljava/util/Set;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->REGISTRY:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->remove()V

    :cond_0
    monitor-exit v2

    :cond_1
    return-void

    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method public append(B)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;
    .locals 2

    iget v0, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    iget v1, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v0, v1

    add-int/2addr v0, p1

    iput v0, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    return-object p0
.end method

.method public append(C)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;
    .locals 2

    iget v0, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    iget v1, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v0, v1

    add-int/2addr v0, p1

    iput v0, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    return-object p0
.end method

.method public append(D)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;
    .locals 2

    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->append(J)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(F)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;
    .locals 2

    iget v0, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    iget v1, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v0, v1

    invoke-static {p1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    return-object p0
.end method

.method public append(I)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;
    .locals 2

    iget v0, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    iget v1, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v0, v1

    add-int/2addr v0, p1

    iput v0, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    return-object p0
.end method

.method public append(J)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;
    .locals 3

    iget v0, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    iget v1, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v0, v1

    const/16 v1, 0x20

    shr-long v1, p1, v1

    xor-long/2addr v1, p1

    long-to-int v1, v1

    add-int/2addr v0, v1

    iput v0, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    return-object p0
.end method

.method public append(Ljava/lang/Object;)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;
    .locals 2

    if-nez p1, :cond_0

    iget v0, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    iget v1, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v0, v1

    iput v0, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    :goto_0
    return-object p0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_9

    instance-of v0, p1, [J

    if-eqz v0, :cond_1

    check-cast p1, [J

    invoke-virtual {p0, p1}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->append([J)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;

    goto :goto_0

    :cond_1
    instance-of v0, p1, [I

    if-eqz v0, :cond_2

    check-cast p1, [I

    invoke-virtual {p0, p1}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->append([I)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;

    goto :goto_0

    :cond_2
    instance-of v0, p1, [S

    if-eqz v0, :cond_3

    check-cast p1, [S

    invoke-virtual {p0, p1}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->append([S)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;

    goto :goto_0

    :cond_3
    instance-of v0, p1, [C

    if-eqz v0, :cond_4

    check-cast p1, [C

    invoke-virtual {p0, p1}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->append([C)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;

    goto :goto_0

    :cond_4
    instance-of v0, p1, [B

    if-eqz v0, :cond_5

    check-cast p1, [B

    invoke-virtual {p0, p1}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->append([B)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;

    goto :goto_0

    :cond_5
    instance-of v0, p1, [D

    if-eqz v0, :cond_6

    check-cast p1, [D

    invoke-virtual {p0, p1}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->append([D)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;

    goto :goto_0

    :cond_6
    instance-of v0, p1, [F

    if-eqz v0, :cond_7

    check-cast p1, [F

    invoke-virtual {p0, p1}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->append([F)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;

    goto :goto_0

    :cond_7
    instance-of v0, p1, [Z

    if-eqz v0, :cond_8

    check-cast p1, [Z

    invoke-virtual {p0, p1}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->append([Z)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;

    goto :goto_0

    :cond_8
    check-cast p1, [Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->append([Ljava/lang/Object;)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;

    goto :goto_0

    :cond_9
    iget v0, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    iget v1, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v0, v1

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    goto :goto_0
.end method

.method public append(S)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;
    .locals 2

    iget v0, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    iget v1, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v0, v1

    add-int/2addr v0, p1

    iput v0, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    return-object p0
.end method

.method public append(Z)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;
    .locals 2

    iget v0, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    iget v1, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v1, v0

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    add-int/2addr v0, v1

    iput v0, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    return-object p0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public append([B)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;
    .locals 3

    if-nez p1, :cond_1

    iget v1, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    iget v2, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v1, v2

    iput v1, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    :cond_0
    return-object p0

    :cond_1
    array-length v2, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v2, :cond_0

    aget-byte v0, p1, v1

    invoke-virtual {p0, v0}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->append(B)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public append([C)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;
    .locals 3

    if-nez p1, :cond_1

    iget v1, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    iget v2, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v1, v2

    iput v1, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    :cond_0
    return-object p0

    :cond_1
    array-length v2, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v2, :cond_0

    aget-char v0, p1, v1

    invoke-virtual {p0, v0}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->append(C)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public append([D)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;
    .locals 4

    if-nez p1, :cond_1

    iget v2, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    iget v3, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v2, v3

    iput v2, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    :cond_0
    return-object p0

    :cond_1
    array-length v3, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v3, :cond_0

    aget-wide v0, p1, v2

    invoke-virtual {p0, v0, v1}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->append(D)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public append([F)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;
    .locals 3

    if-nez p1, :cond_1

    iget v1, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    iget v2, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v1, v2

    iput v1, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    :cond_0
    return-object p0

    :cond_1
    array-length v2, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v2, :cond_0

    aget v0, p1, v1

    invoke-virtual {p0, v0}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->append(F)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public append([I)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;
    .locals 3

    if-nez p1, :cond_1

    iget v1, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    iget v2, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v1, v2

    iput v1, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    :cond_0
    return-object p0

    :cond_1
    array-length v2, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v2, :cond_0

    aget v0, p1, v1

    invoke-virtual {p0, v0}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->append(I)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public append([J)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;
    .locals 4

    if-nez p1, :cond_1

    iget v2, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    iget v3, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v2, v3

    iput v2, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    :cond_0
    return-object p0

    :cond_1
    array-length v3, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v3, :cond_0

    aget-wide v0, p1, v2

    invoke-virtual {p0, v0, v1}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->append(J)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public append([Ljava/lang/Object;)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;
    .locals 3

    if-nez p1, :cond_1

    iget v1, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    iget v2, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v1, v2

    iput v1, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    :cond_0
    return-object p0

    :cond_1
    array-length v2, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v0, p1, v1

    invoke-virtual {p0, v0}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->append(Ljava/lang/Object;)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public append([S)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;
    .locals 3

    if-nez p1, :cond_1

    iget v1, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    iget v2, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v1, v2

    iput v1, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    :cond_0
    return-object p0

    :cond_1
    array-length v2, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v2, :cond_0

    aget-short v0, p1, v1

    invoke-virtual {p0, v0}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->append(S)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public append([Z)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;
    .locals 3

    if-nez p1, :cond_1

    iget v1, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    iget v2, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v1, v2

    iput v1, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    :cond_0
    return-object p0

    :cond_1
    array-length v2, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v2, :cond_0

    aget-boolean v0, p1, v1

    invoke-virtual {p0, v0}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->append(Z)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public appendSuper(I)Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;
    .locals 2

    iget v0, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    iget v1, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iConstant:I

    mul-int/2addr v0, v1

    add-int/2addr v0, p1

    iput v0, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    return-object p0
.end method

.method public build()Ljava/lang/Integer;
    .locals 1

    invoke-virtual {p0}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->toHashCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->build()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    invoke-virtual {p0}, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->toHashCode()I

    move-result v0

    return v0
.end method

.method public toHashCode()I
    .locals 1

    iget v0, p0, Lexternal/org/apache/commons/lang3/builder/HashCodeBuilder;->iTotal:I

    return v0
.end method
