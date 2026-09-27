	.include "macro.inc"

	.syntax unified

	thumb_func_start InitMinimapFlashPalette
InitMinimapFlashPalette: @ 0x080A2EAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _080A2F2C @ =0x0200050C
	ldr r0, _080A2F30 @ =0x02020140
	str r0, [r1]
	movs r2, #1
	ldr r0, _080A2F34 @ =0x02022860
	mov sl, r0
	movs r0, #0x1f
	mov r8, r0
	mov sb, r1
_080A2EC8:
	adds r0, r2, #0
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, sl
	ldrh r0, [r0]
	adds r5, r0, #0
	mov r1, r8
	ands r5, r1
	asrs r4, r0, #5
	ands r4, r1
	asrs r3, r0, #0xa
	ands r3, r1
	adds r0, r2, #1
	mov ip, r0
	lsls r6, r2, #1
	movs r7, #7
_080A2EE8:
	mov r1, sb
	ldr r0, [r1]
	adds r0, r6, r0
	lsls r1, r3, #0xa
	lsls r2, r4, #5
	adds r1, r1, r2
	adds r1, r1, r5
	strh r1, [r0]
	adds r5, #3
	cmp r5, #0x1f
	ble _080A2F00
	movs r5, #0x1f
_080A2F00:
	adds r4, #3
	cmp r4, #0x1f
	ble _080A2F08
	movs r4, #0x1f
_080A2F08:
	adds r3, #3
	cmp r3, #0x1f
	ble _080A2F10
	movs r3, #0x1f
_080A2F10:
	adds r6, #0x20
	subs r7, #1
	cmp r7, #0
	bge _080A2EE8
	mov r2, ip
	cmp r2, #0xf
	ble _080A2EC8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A2F2C: .4byte 0x0200050C
_080A2F30: .4byte 0x02020140
_080A2F34: .4byte 0x02022860
