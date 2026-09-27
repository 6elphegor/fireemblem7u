	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080792C4
sub_080792C4: @ 0x080792C4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r3, _080792E0 @ =0x08C9EDA0
	ldr r1, _080792E4 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _08079310
	b _08079316
	.align 2, 0
_080792E0: .4byte 0x08C9EDA0
_080792E4: .4byte 0x0202BBF8
_080792E8:
	adds r0, r3, #0
	b _08079318
_080792EC:
	ldrb r2, [r3]
	cmp r5, r2
	bne _080792F6
	cmp r4, r0
	beq _08079300
_080792F6:
	ldrb r0, [r3, #1]
	cmp r5, r0
	bne _0807930E
	cmp r4, r2
	bne _0807930E
_08079300:
	ldrb r2, [r3, #2]
	cmp r2, #0x43
	beq _080792E8
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	cmp r0, r2
	beq _080792E8
_0807930E:
	adds r3, #0x10
_08079310:
	ldrb r0, [r3, #1]
	cmp r0, #0
	bne _080792EC
_08079316:
	movs r0, #0
_08079318:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
