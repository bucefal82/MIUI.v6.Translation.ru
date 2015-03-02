.class public Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;
.super Ljava/lang/Object;
.source "EqualsBuilder.java"

# interfaces
.implements Lexternal/org/apache/commons/lang3/builder/Builder;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lexternal/org/apache/commons/lang3/builder/Builder",
        "<",
        "Ljava/lang/Boolean;",
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
            "Lexternal/org/apache/commons/lang3/tuple/Pair",
            "<",
            "Lexternal/org/apache/commons/lang3/builder/IDKey;",
            "Lexternal/org/apache/commons/lang3/builder/IDKey;",
            ">;>;>;"
        }
    .end annotation
.end field


# instance fields
.field private isEquals:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->REGISTRY:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    return-void
.end method

.method static getRegisterPair(Ljava/lang/Object;Ljava/lang/Object;)Lexternal/org/apache/commons/lang3/tuple/Pair;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")",
            "Lexternal/org/apache/commons/lang3/tuple/Pair",
            "<",
            "Lexternal/org/apache/commons/lang3/builder/IDKey;",
            "Lexternal/org/apache/commons/lang3/builder/IDKey;",
            ">;"
        }
    .end annotation

    new-instance v0, Lexternal/org/apache/commons/lang3/builder/IDKey;

    invoke-direct {v0, p0}, Lexternal/org/apache/commons/lang3/builder/IDKey;-><init>(Ljava/lang/Object;)V

    new-instance v1, Lexternal/org/apache/commons/lang3/builder/IDKey;

    invoke-direct {v1, p1}, Lexternal/org/apache/commons/lang3/builder/IDKey;-><init>(Ljava/lang/Object;)V

    invoke-static {v0, v1}, Lexternal/org/apache/commons/lang3/tuple/Pair;->of(Ljava/lang/Object;Ljava/lang/Object;)Lexternal/org/apache/commons/lang3/tuple/Pair;

    move-result-object v2

    return-object v2
.end method

.method static getRegistry()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lexternal/org/apache/commons/lang3/tuple/Pair",
            "<",
            "Lexternal/org/apache/commons/lang3/builder/IDKey;",
            "Lexternal/org/apache/commons/lang3/builder/IDKey;",
            ">;>;"
        }
    .end annotation

    sget-object v0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->REGISTRY:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    return-object v0
.end method

.method static isRegistered(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 5

    invoke-static {}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->getRegistry()Ljava/util/Set;

    move-result-object v1

    invoke-static {p0, p1}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->getRegisterPair(Ljava/lang/Object;Ljava/lang/Object;)Lexternal/org/apache/commons/lang3/tuple/Pair;

    move-result-object v0

    invoke-virtual {v0}, Lexternal/org/apache/commons/lang3/tuple/Pair;->getLeft()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lexternal/org/apache/commons/lang3/builder/IDKey;

    invoke-virtual {v0}, Lexternal/org/apache/commons/lang3/tuple/Pair;->getRight()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lexternal/org/apache/commons/lang3/builder/IDKey;

    invoke-static {v3, v4}, Lexternal/org/apache/commons/lang3/tuple/Pair;->of(Ljava/lang/Object;Ljava/lang/Object;)Lexternal/org/apache/commons/lang3/tuple/Pair;

    move-result-object v2

    if-eqz v1, :cond_1

    invoke-interface {v1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    :cond_0
    const/4 v3, 0x1

    :goto_0
    return v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private static reflectionAppend(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;Z[Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;",
            "Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;",
            "Z[",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-static {p0, p1}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isRegistered(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    :goto_0
    return-void

    :cond_0
    :try_start_0
    invoke-static {p0, p1}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->register(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p2}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    const/4 v4, 0x1

    invoke-static {v2, v4}, Ljava/lang/reflect/AccessibleObject;->setAccessible([Ljava/lang/reflect/AccessibleObject;Z)V

    const/4 v3, 0x0

    :goto_1
    array-length v4, v2

    if-ge v3, v4, :cond_1

    iget-boolean v4, p3, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v4, :cond_2

    :cond_1
    invoke-static {p0, p1}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->unregister(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    :try_start_1
    aget-object v1, v2, v3

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {p5, v4}, Lexternal/org/apache/commons/lang3/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x24

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_4

    if-nez p4, :cond_3

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isTransient(I)Z

    move-result v4

    if-nez v4, :cond_4

    :cond_3
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isStatic(I)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v4

    if-nez v4, :cond_4

    :try_start_2
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p3, v4, v5}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->append(Ljava/lang/Object;Ljava/lang/Object;)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;
    :try_end_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_4
    add-int/lit8 v3, v3, 0x1

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

    invoke-static {p0, p1}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->unregister(Ljava/lang/Object;Ljava/lang/Object;)V

    throw v4
.end method

.method public static reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    invoke-static {p2}, Lexternal/org/apache/commons/lang3/builder/ReflectionToStringBuilder;->toNoNullStringArray(Ljava/util/Collection;)[Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;Z)Z
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-static {p0, p1, p2, v0, v1}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static varargs reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)Z
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Z",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    const/4 v9, 0x0

    if-ne p0, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    if-eqz p0, :cond_1

    if-nez p1, :cond_2

    :cond_1
    move v0, v9

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v7, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    move-object v2, v7

    invoke-virtual {v8, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    move-object v2, v8

    :cond_3
    :goto_1
    new-instance v3, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;

    invoke-direct {v3}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;-><init>()V

    move-object v0, p0

    move-object v1, p1

    move v4, p2

    move-object v5, p4

    :try_start_0
    invoke-static/range {v0 .. v5}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->reflectionAppend(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;Z[Ljava/lang/String;)V

    :goto_2
    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    if-eqz v0, :cond_4

    if-ne v2, p3, :cond_7

    :cond_4
    invoke-virtual {v3}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals()Z

    move-result v0

    goto :goto_0

    :cond_5
    invoke-virtual {v8, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    move-object v2, v8

    invoke-virtual {v7, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    move-object v2, v7

    goto :goto_1

    :cond_6
    move v0, v9

    goto :goto_0

    :cond_7
    :try_start_1
    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v2

    move-object v0, p0

    move-object v1, p1

    move v4, p2

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->reflectionAppend(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;Z[Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    :catch_0
    move-exception v6

    move v0, v9

    goto :goto_0
.end method

.method public static varargs reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/String;)Z
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1, p2}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static register(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 5

    const-class v3, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;

    monitor-enter v3

    :try_start_0
    invoke-static {}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->getRegistry()Ljava/util/Set;

    move-result-object v2

    if-nez v2, :cond_0

    sget-object v2, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->REGISTRY:Ljava/lang/ThreadLocal;

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v2, v4}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    :cond_0
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->getRegistry()Ljava/util/Set;

    move-result-object v1

    invoke-static {p0, p1}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->getRegisterPair(Ljava/lang/Object;Ljava/lang/Object;)Lexternal/org/apache/commons/lang3/tuple/Pair;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void

    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method static unregister(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 4

    invoke-static {}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->getRegistry()Ljava/util/Set;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-static {p0, p1}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->getRegisterPair(Ljava/lang/Object;Ljava/lang/Object;)Lexternal/org/apache/commons/lang3/tuple/Pair;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    const-class v3, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;

    monitor-enter v3

    :try_start_0
    invoke-static {}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->getRegistry()Ljava/util/Set;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    sget-object v2, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->REGISTRY:Ljava/lang/ThreadLocal;

    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->remove()V

    :cond_0
    monitor-exit v3

    :cond_1
    return-void

    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method


# virtual methods
.method public append(BB)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;
    .locals 1

    iget-boolean v0, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    :goto_0
    return-object p0

    :cond_0
    if-ne p1, p2, :cond_1

    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public append(CC)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;
    .locals 1

    iget-boolean v0, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    :goto_0
    return-object p0

    :cond_0
    if-ne p1, p2, :cond_1

    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public append(DD)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;
    .locals 4

    iget-boolean v0, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    :goto_0
    return-object p0

    :cond_0
    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    invoke-static {p3, p4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v2

    invoke-virtual {p0, v0, v1, v2, v3}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->append(JJ)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;

    move-result-object p0

    goto :goto_0
.end method

.method public append(FF)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;
    .locals 2

    iget-boolean v0, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    :goto_0
    return-object p0

    :cond_0
    invoke-static {p1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    invoke-static {p2}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->append(II)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;

    move-result-object p0

    goto :goto_0
.end method

.method public append(II)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;
    .locals 1

    iget-boolean v0, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    :goto_0
    return-object p0

    :cond_0
    if-ne p1, p2, :cond_1

    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public append(JJ)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;
    .locals 1

    iget-boolean v0, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    :goto_0
    return-object p0

    :cond_0
    cmp-long v0, p1, p3

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public append(Ljava/lang/Object;Ljava/lang/Object;)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;
    .locals 4

    const/4 v3, 0x0

    iget-boolean v1, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-object p0

    :cond_1
    if-eq p1, p2, :cond_0

    if-eqz p1, :cond_2

    if-nez p2, :cond_3

    :cond_2
    invoke-virtual {p0, v3}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    :cond_3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-nez v1, :cond_4

    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    iput-boolean v1, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    goto :goto_0

    :cond_4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_5

    invoke-virtual {p0, v3}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    :cond_5
    instance-of v1, p1, [J

    if-eqz v1, :cond_6

    check-cast p1, [J

    check-cast p2, [J

    invoke-virtual {p0, p1, p2}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->append([J[J)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;

    goto :goto_0

    :cond_6
    instance-of v1, p1, [I

    if-eqz v1, :cond_7

    check-cast p1, [I

    check-cast p2, [I

    invoke-virtual {p0, p1, p2}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->append([I[I)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;

    goto :goto_0

    :cond_7
    instance-of v1, p1, [S

    if-eqz v1, :cond_8

    check-cast p1, [S

    check-cast p2, [S

    invoke-virtual {p0, p1, p2}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->append([S[S)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;

    goto :goto_0

    :cond_8
    instance-of v1, p1, [C

    if-eqz v1, :cond_9

    check-cast p1, [C

    check-cast p2, [C

    invoke-virtual {p0, p1, p2}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->append([C[C)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;

    goto :goto_0

    :cond_9
    instance-of v1, p1, [B

    if-eqz v1, :cond_a

    check-cast p1, [B

    check-cast p2, [B

    invoke-virtual {p0, p1, p2}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->append([B[B)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;

    goto :goto_0

    :cond_a
    instance-of v1, p1, [D

    if-eqz v1, :cond_b

    check-cast p1, [D

    check-cast p2, [D

    invoke-virtual {p0, p1, p2}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->append([D[D)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;

    goto :goto_0

    :cond_b
    instance-of v1, p1, [F

    if-eqz v1, :cond_c

    check-cast p1, [F

    check-cast p2, [F

    invoke-virtual {p0, p1, p2}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->append([F[F)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;

    goto :goto_0

    :cond_c
    instance-of v1, p1, [Z

    if-eqz v1, :cond_d

    check-cast p1, [Z

    check-cast p2, [Z

    invoke-virtual {p0, p1, p2}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->append([Z[Z)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;

    goto/16 :goto_0

    :cond_d
    check-cast p1, [Ljava/lang/Object;

    check-cast p2, [Ljava/lang/Object;

    invoke-virtual {p0, p1, p2}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->append([Ljava/lang/Object;[Ljava/lang/Object;)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;

    goto/16 :goto_0
.end method

.method public append(SS)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;
    .locals 1

    iget-boolean v0, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    :goto_0
    return-object p0

    :cond_0
    if-ne p1, p2, :cond_1

    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public append(ZZ)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;
    .locals 1

    iget-boolean v0, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    :goto_0
    return-object p0

    :cond_0
    if-ne p1, p2, :cond_1

    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public append([B[B)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;
    .locals 4

    const/4 v3, 0x0

    iget-boolean v1, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-object p0

    :cond_1
    if-eq p1, p2, :cond_0

    if-eqz p1, :cond_2

    if-nez p2, :cond_3

    :cond_2
    invoke-virtual {p0, v3}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    :cond_3
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_4

    invoke-virtual {p0, v3}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    :cond_4
    const/4 v0, 0x0

    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget-boolean v1, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_0

    aget-byte v1, p1, v0

    aget-byte v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->append(BB)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public append([C[C)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;
    .locals 4

    const/4 v3, 0x0

    iget-boolean v1, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-object p0

    :cond_1
    if-eq p1, p2, :cond_0

    if-eqz p1, :cond_2

    if-nez p2, :cond_3

    :cond_2
    invoke-virtual {p0, v3}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    :cond_3
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_4

    invoke-virtual {p0, v3}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    :cond_4
    const/4 v0, 0x0

    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget-boolean v1, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_0

    aget-char v1, p1, v0

    aget-char v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->append(CC)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public append([D[D)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;
    .locals 5

    const/4 v3, 0x0

    iget-boolean v1, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-object p0

    :cond_1
    if-eq p1, p2, :cond_0

    if-eqz p1, :cond_2

    if-nez p2, :cond_3

    :cond_2
    invoke-virtual {p0, v3}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    :cond_3
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_4

    invoke-virtual {p0, v3}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    :cond_4
    const/4 v0, 0x0

    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget-boolean v1, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_0

    aget-wide v1, p1, v0

    aget-wide v3, p2, v0

    invoke-virtual {p0, v1, v2, v3, v4}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->append(DD)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public append([F[F)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;
    .locals 4

    const/4 v3, 0x0

    iget-boolean v1, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-object p0

    :cond_1
    if-eq p1, p2, :cond_0

    if-eqz p1, :cond_2

    if-nez p2, :cond_3

    :cond_2
    invoke-virtual {p0, v3}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    :cond_3
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_4

    invoke-virtual {p0, v3}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    :cond_4
    const/4 v0, 0x0

    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget-boolean v1, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_0

    aget v1, p1, v0

    aget v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->append(FF)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public append([I[I)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;
    .locals 4

    const/4 v3, 0x0

    iget-boolean v1, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-object p0

    :cond_1
    if-eq p1, p2, :cond_0

    if-eqz p1, :cond_2

    if-nez p2, :cond_3

    :cond_2
    invoke-virtual {p0, v3}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    :cond_3
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_4

    invoke-virtual {p0, v3}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    :cond_4
    const/4 v0, 0x0

    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget-boolean v1, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_0

    aget v1, p1, v0

    aget v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->append(II)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public append([J[J)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;
    .locals 5

    const/4 v3, 0x0

    iget-boolean v1, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-object p0

    :cond_1
    if-eq p1, p2, :cond_0

    if-eqz p1, :cond_2

    if-nez p2, :cond_3

    :cond_2
    invoke-virtual {p0, v3}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    :cond_3
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_4

    invoke-virtual {p0, v3}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    :cond_4
    const/4 v0, 0x0

    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget-boolean v1, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_0

    aget-wide v1, p1, v0

    aget-wide v3, p2, v0

    invoke-virtual {p0, v1, v2, v3, v4}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->append(JJ)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public append([Ljava/lang/Object;[Ljava/lang/Object;)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;
    .locals 4

    const/4 v3, 0x0

    iget-boolean v1, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-object p0

    :cond_1
    if-eq p1, p2, :cond_0

    if-eqz p1, :cond_2

    if-nez p2, :cond_3

    :cond_2
    invoke-virtual {p0, v3}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    :cond_3
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_4

    invoke-virtual {p0, v3}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    :cond_4
    const/4 v0, 0x0

    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget-boolean v1, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_0

    aget-object v1, p1, v0

    aget-object v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->append(Ljava/lang/Object;Ljava/lang/Object;)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public append([S[S)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;
    .locals 4

    const/4 v3, 0x0

    iget-boolean v1, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-object p0

    :cond_1
    if-eq p1, p2, :cond_0

    if-eqz p1, :cond_2

    if-nez p2, :cond_3

    :cond_2
    invoke-virtual {p0, v3}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    :cond_3
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_4

    invoke-virtual {p0, v3}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    :cond_4
    const/4 v0, 0x0

    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget-boolean v1, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_0

    aget-short v1, p1, v0

    aget-short v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->append(SS)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public append([Z[Z)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;
    .locals 4

    const/4 v3, 0x0

    iget-boolean v1, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-object p0

    :cond_1
    if-eq p1, p2, :cond_0

    if-eqz p1, :cond_2

    if-nez p2, :cond_3

    :cond_2
    invoke-virtual {p0, v3}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    :cond_3
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_4

    invoke-virtual {p0, v3}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    :cond_4
    const/4 v0, 0x0

    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget-boolean v1, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_0

    aget-boolean v1, p1, v0

    aget-boolean v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->append(ZZ)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public appendSuper(Z)Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;
    .locals 1

    iget-boolean v0, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    :goto_0
    return-object p0

    :cond_0
    iput-boolean p1, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    goto :goto_0
.end method

.method public build()Ljava/lang/Boolean;
    .locals 1

    invoke-virtual {p0}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->build()Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public isEquals()Z
    .locals 1

    iget-boolean v0, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    return v0
.end method

.method public reset()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    return-void
.end method

.method protected setEquals(Z)V
    .locals 0

    iput-boolean p1, p0, Lexternal/org/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    return-void
.end method
