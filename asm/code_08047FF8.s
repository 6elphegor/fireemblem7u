	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047FF8
sub_08047FF8: @ 0x08047FF8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, _0804813C @ =0x000082DA
	mov r8, r0
	movs r2, #0x2a
	ldrsh r1, [r7, r2]
	movs r3, #0x2c
	ldrsh r2, [r7, r3]
	ldr r3, _08048140 @ =0x08B9A3F0
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r4, _08048144 @ =0x081D559C
	adds r5, r7, #0
	adds r5, #0x2e
	ldrb r6, [r5]
	lsls r0, r6, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldrb r5, [r5]
	cmp r5, #2
	bne _08048042
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r0, [r0]
	bl sub_08047FA8
_08048042:
	adds r2, r7, #0
	adds r2, #0x30
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strb r0, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r7, #0x2e]
	cmp r1, r0
	bne _0804812E
	ldrh r1, [r7, #0x3a]
	ldrh r2, [r7, #0x36]
	adds r0, r1, r2
	strh r0, [r7, #0x36]
	ldrh r2, [r7, #0x3c]
	ldrh r3, [r7, #0x38]
	adds r0, r2, r3
	strh r0, [r7, #0x38]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08048076
	subs r0, r1, #1
	strh r0, [r7, #0x3a]
_08048076:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08048082
	subs r0, r2, #1
	strh r0, [r7, #0x3c]
_08048082:
	bl GetGameTime
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _080480AA
	ldrh r1, [r7, #0x32]
	movs r6, #0x32
	ldrsh r0, [r7, r6]
	cmp r0, #0
	bge _0804809C
	adds r0, r1, #1
	strh r0, [r7, #0x32]
_0804809C:
	ldrh r1, [r7, #0x34]
	movs r2, #0x34
	ldrsh r0, [r7, r2]
	cmp r0, #0x34
	ble _080480AA
	subs r0, r1, #1
	strh r0, [r7, #0x34]
_080480AA:
	movs r3, #0x2a
	ldrsh r5, [r7, r3]
	movs r6, #0x32
	ldrsh r0, [r7, r6]
	adds r0, #0x46
	adds r5, r5, r0
	movs r0, #0x2c
	ldrsh r4, [r7, r0]
	adds r4, #8
	ldr r6, _08048148 @ =0x08B905D0
	ldrh r1, [r7, #0x36]
	lsrs r0, r1, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r0, r8
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	movs r2, #0x2a
	ldrsh r5, [r7, r2]
	movs r3, #0x34
	ldrsh r0, [r7, r3]
	adds r0, #0x46
	adds r5, r5, r0
	movs r6, #0x2c
	ldrsh r4, [r7, r6]
	adds r4, #8
	ldr r6, _0804814C @ =0x08B90620
	ldrh r1, [r7, #0x38]
	lsrs r0, r1, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r0, r8
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	movs r2, #0x2a
	ldrsh r1, [r7, r2]
	adds r1, #0x4b
	movs r3, #0x2c
	ldrsh r2, [r7, r3]
	adds r2, #8
	ldr r3, _08048150 @ =0x08B9A404
	ldr r0, _08048154 @ =0x0203D90C
	ldrb r0, [r0, #5]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_0804812E:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804813C: .4byte 0x000082DA
_08048140: .4byte 0x08B9A3F0
_08048144: .4byte 0x081D559C
_08048148: .4byte 0x08B905D0
_0804814C: .4byte 0x08B90620
_08048150: .4byte 0x08B9A404
_08048154: .4byte 0x0203D90C
