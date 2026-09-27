	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080833AC
sub_080833AC: @ 0x080833AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, #0x10
	mov r8, r0
	adds r1, r4, #0
	adds r1, #0x44
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xbf
	ble _080833D2
	movs r0, #0xc0
	strh r0, [r1]
_080833D2:
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r7, r0, #0
	adds r7, #0x10
	bl GetDialogueBoxConfig
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08083424
	strh r5, [r4, #0x3c]
	adds r0, r6, #0
	adds r0, #8
	strh r0, [r4, #0x3e]
	bl GetDialogueBoxConfig
	movs r1, #0x40
	ands r1, r0
	cmp r1, #0
	bne _0808341C
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	adds r0, r0, r7
	cmp r0, #0xf0
	ble _0808340A
	movs r0, #0xf0
	subs r0, r0, r7
	strh r0, [r4, #0x3c]
_0808340A:
	movs r2, #0x3e
	ldrsh r0, [r4, r2]
	add r0, r8
	cmp r0, #0xa0
	ble _0808341C
	movs r0, #0x98
	mov r1, r8
	subs r0, r0, r1
	strh r0, [r4, #0x3e]
_0808341C:
	ldrh r0, [r4, #0x3c]
	adds r0, #8
	strh r0, [r4, #0x3c]
	b _08083428
_08083424:
	strh r5, [r4, #0x3c]
	strh r6, [r4, #0x3e]
_08083428:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
