	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08075218
sub_08075218: @ 0x08075218
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl RandNextB
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #9
	bl DivRem
	adds r1, r0, #0
	subs r0, r1, #4
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r4, r0, #0x10
	bl RandNextB
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #9
	bl DivRem
	adds r1, r0, #0
	subs r0, r1, #4
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	movs r0, #0
	adds r1, r4, #0
	bl SetBgOffset
	bl RandNextB
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #9
	bl DivRem
	adds r1, r0, #0
	subs r0, r1, #4
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r4, r0, #0x10
	bl RandNextB
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #9
	bl DivRem
	adds r1, r0, #0
	subs r0, r1, #4
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	movs r0, #1
	adds r1, r4, #0
	bl SetBgOffset
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strh r3, [r0]
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0xf
	ble _080752C0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, [r7]
	bl Proc_Break
_080752C0:
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
