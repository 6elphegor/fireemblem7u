	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08026308
sub_08026308: @ 0x08026308
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r0, [sp, #0x1c]
	ldr r4, [sp, #0x20]
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	bl GetClassSMSId
	adds r2, r0, #0
	ldr r0, _0802635C @ =0x08B93E48
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	adds r4, r0, #1
	adds r1, r6, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08026390
	adds r0, r5, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _08026390
	ldr r1, _08026360 @ =0x08C99700
	movs r0, #0x7f
	ands r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #0
	blt _08026390
	cmp r0, #1
	ble _08026364
	cmp r0, #2
	beq _0802637C
	b _08026390
	.align 2, 0
_0802635C: .4byte 0x08B93E48
_08026360: .4byte 0x08C99700
_08026364:
	adds r2, r5, #0
	subs r2, #0x10
	ldr r3, _08026378 @ =0x08B905D8
	adds r0, r7, r4
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	bl PutSprite
	b _08026390
	.align 2, 0
_08026378: .4byte 0x08B905D8
_0802637C:
	adds r1, r6, #0
	subs r1, #8
	adds r2, r5, #0
	subs r2, #0x10
	ldr r3, _0802639C @ =0x08B905C0
	adds r0, r7, r4
	str r0, [sp]
	mov r0, r8
	bl PutSprite
_08026390:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802639C: .4byte 0x08B905C0
