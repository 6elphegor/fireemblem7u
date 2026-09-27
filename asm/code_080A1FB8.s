	.include "macro.inc"

	.syntax unified

	thumb_func_start IsMultiArenaSaveReady
IsMultiArenaSaveReady: @ 0x080A1FB8
	push {r4, lr}
	sub sp, #0xc
	movs r0, #5
	bl sub_080A1AB4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A1FCE
	b _080A1FE6
_080A1FCA:
	movs r0, #1
	b _080A1FE8
_080A1FCE:
	movs r4, #0
_080A1FD0:
	adds r0, r4, #0
	mov r1, sp
	bl sub_080A1C44
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080A1FCA
	adds r4, #1
	cmp r4, #9
	ble _080A1FD0
_080A1FE6:
	movs r0, #0
_080A1FE8:
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
