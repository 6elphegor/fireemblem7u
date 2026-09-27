	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08005218
sub_08005218: @ 0x08005218
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0800522E
	movs r0, #0
	b _08005272
_0800522E:
	bl sub_080051A0
	ldr r3, _08005278 @ =0x02026D30
	ldr r0, [r3, #0xc]
	ldr r2, _0800527C @ =0xFFFFFF00
	adds r1, r0, r2
	cmp r1, #0
	bge _08005240
	movs r1, #0
_08005240:
	adds r2, r0, #0
	subs r2, #0x14
	cmp r2, #0
	bge _0800524A
	movs r2, #0
_0800524A:
	movs r0, #0x40
	ands r0, r4
	cmp r0, #0
	beq _0800525C
	ldr r0, [r3, #0x10]
	cmp r1, r0
	bhs _0800525C
	subs r0, #1
	str r0, [r3, #0x10]
_0800525C:
	movs r0, #0x80
	ands r0, r4
	cmp r0, #0
	beq _08005270
	ldr r1, _08005278 @ =0x02026D30
	ldr r0, [r1, #0x10]
	cmp r2, r0
	bls _08005270
	adds r0, #1
	str r0, [r1, #0x10]
_08005270:
	movs r0, #1
_08005272:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08005278: .4byte 0x02026D30
_0800527C: .4byte 0xFFFFFF00
