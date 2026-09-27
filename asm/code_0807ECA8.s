	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807ECA8
sub_0807ECA8: @ 0x0807ECA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x12
	lsls r3, r1, #1
	cmp r3, #0x10
	ble _0807ECC8
	movs r3, #0x10
_0807ECC8:
	ldr r2, _0807ED28 @ =0x03002870
	adds r5, r2, #0
	adds r5, #0x3c
	movs r0, #0x3f
	mov sl, r0
	ldrb r4, [r5]
	ands r0, r4
	strb r0, [r5]
	movs r0, #0x10
	subs r0, r0, r1
	movs r6, #0x44
	adds r6, r6, r2
	mov r8, r6
	movs r4, #0
	strb r0, [r6]
	adds r7, r2, #0
	adds r7, #0x45
	strb r3, [r7]
	adds r6, r2, #0
	adds r6, #0x46
	strb r4, [r6]
	cmp r1, #0x10
	bne _0807ED18
	movs r0, #1
	bl RemoveFireDragonSpritefx
	movs r0, #2
	bl RemoveFireDragonSpritefx
	mov r0, sl
	ldrb r1, [r5]
	ands r0, r1
	strb r0, [r5]
	mov r0, r8
	strb r4, [r0]
	strb r4, [r7]
	strb r4, [r6]
	mov r0, sb
	bl Proc_Break
_0807ED18:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807ED28: .4byte 0x03002870
