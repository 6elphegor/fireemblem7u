	.include "macro.inc"

	.syntax unified

	thumb_func_start UpdateMenuButtonPos
UpdateMenuButtonPos: @ 0x08086398
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r5, r2, #0
	ldr r0, _0808641C @ =0x08CC2B94
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r2, #4
	ldrsb r2, [r1, r2]
	movs r4, #5
	ldrsb r4, [r1, r4]
	cmp r2, #0
	bge _080863C6
	cmp r4, #0
	bge _080863C6
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #8
	strh r0, [r1]
	adds r1, r5, #0
	subs r1, #0x18
	adds r0, r3, #0
	adds r0, #0x48
	strh r1, [r0]
_080863C6:
	cmp r2, #0
	ble _080863E0
	cmp r4, #0
	bge _080863E0
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0xa0
	strh r0, [r1]
	adds r1, r5, #0
	subs r1, #0x18
	adds r0, r3, #0
	adds r0, #0x48
	strh r1, [r0]
_080863E0:
	cmp r2, #0
	bge _080863F8
	cmp r4, #0
	ble _080863F8
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #8
	strh r0, [r1]
	movs r0, #0xa0
	subs r0, r0, r5
	adds r1, #2
	strh r0, [r1]
_080863F8:
	cmp r2, #0
	ble _08086416
	cmp r4, #0
	ble _08086416
	movs r0, #0x46
	adds r0, r0, r3
	mov ip, r0
	movs r0, #0xa0
	movs r1, #0xa0
	mov r2, ip
	strh r1, [r2]
	subs r0, r0, r5
	adds r1, r3, #0
	adds r1, #0x48
	strh r0, [r1]
_08086416:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808641C: .4byte 0x08CC2B94
