.class public final Lexternal/org/apache/commons/lang3/tuple/ImmutablePair;
.super Lexternal/org/apache/commons/lang3/tuple/Pair;
.source "ImmutablePair.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<",
        "L:Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Lexternal/org/apache/commons/lang3/tuple/Pair",
        "<T",
        "L;",
        "TR;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x44c3687a6deaffd1L


# instance fields
.field public final left:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "T",
            "L;"
        }
    .end annotation
.end field

.field public final right:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TR;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(T",
            "L;",
            "TR;)V"
        }
    .end annotation

    invoke-direct {p0}, Lexternal/org/apache/commons/lang3/tuple/Pair;-><init>()V

    iput-object p1, p0, Lexternal/org/apache/commons/lang3/tuple/ImmutablePair;->left:Ljava/lang/Object;

    iput-object p2, p0, Lexternal/org/apache/commons/lang3/tuple/ImmutablePair;->right:Ljava/lang/Object;

    return-void
.end method

.method public static of(Ljava/lang/Object;Ljava/lang/Object;)Lexternal/org/apache/commons/lang3/tuple/ImmutablePair;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<",
            "L:Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(T",
            "L;",
            "TR;)",
            "Lexternal/org/apache/commons/lang3/tuple/ImmutablePair",
            "<T",
            "L;",
            "TR;>;"
        }
    .end annotation

    new-instance v0, Lexternal/org/apache/commons/lang3/tuple/ImmutablePair;

    invoke-direct {v0, p0, p1}, Lexternal/org/apache/commons/lang3/tuple/ImmutablePair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method public static bridge synthetic of(Ljava/lang/Object;Ljava/lang/Object;)Lexternal/org/apache/commons/lang3/tuple/Pair;
    .locals 1

    check-cast p0, Ljava/lang/Object;

    check-cast p1, Ljava/lang/Object;

    invoke-static {p0, p1}, Lexternal/org/apache/commons/lang3/tuple/ImmutablePair;->of(Ljava/lang/Object;Ljava/lang/Object;)Lexternal/org/apache/commons/lang3/tuple/ImmutablePair;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getLeft()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()T",
            "L;"
        }
    .end annotation

    iget-object v0, p0, Lexternal/org/apache/commons/lang3/tuple/ImmutablePair;->left:Ljava/lang/Object;

    return-object v0
.end method

.method public getRight()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TR;"
        }
    .end annotation

    iget-object v0, p0, Lexternal/org/apache/commons/lang3/tuple/ImmutablePair;->right:Ljava/lang/Object;

    return-object v0
.end method

.method public setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)TR;"
        }
    .end annotation

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
