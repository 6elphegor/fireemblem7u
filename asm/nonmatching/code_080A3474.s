	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A3474
sub_080A3474: @ 0x080A3474
	push {r4, r5, lr}
	sub sp, #0x48
	adds r4, r0, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A3488
	movs r0, #0
	b _080A350E
_080A3488:
	adds r0, r4, #0
	mov r1, sp
	bl ReadGameSavePlaySt
	mov r1, sp
	adds r1, #0x2b
	movs r0, #1
	ldrb r2, [r1]
	ands r0, r2
	adds r4, r1, #0
	cmp r0, #0
	bne _080A34B8
	ldr r1, _080A34B4 @ =0x0202BBF8
	adds r1, #0x2b
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	movs r0, #1
	b _080A350E
	.align 2, 0
_080A34B4: .4byte 0x0202BBF8
_080A34B8:
	ldr r2, _080A34D8 @ =0x0202BBF8
	adds r1, r2, #0
	adds r1, #0x2b
	movs r0, #1
	ldrb r5, [r1]
	orrs r0, r5
	strb r0, [r1]
	add r0, sp, #0x20
	ldrb r1, [r0]
	cmp r1, #0
	bne _080A34DC
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	b _080A34E0
	.align 2, 0
_080A34D8: .4byte 0x0202BBF8
_080A34DC:
	bl SetTacticianName
_080A34E0:
	ldr r2, _080A3518 @ =0x0202BBF8
	add r0, sp, #0x2c
	ldrb r0, [r0]
	lsls r1, r0, #0x1f
	adds r3, r2, #0
	adds r3, #0x2c
	lsrs r1, r1, #0x1f
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r5, [r3]
	ands r0, r5
	orrs r0, r1
	strb r0, [r3]
	ldrb r4, [r4]
	lsrs r1, r4, #4
	adds r2, #0x2b
	lsls r1, r1, #4
	movs r0, #0xf
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	movs r0, #2
_080A350E:
	add sp, #0x48
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A3518: .4byte 0x0202BBF8
