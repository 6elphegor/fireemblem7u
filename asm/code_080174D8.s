	.include "macro.inc"

	.syntax unified

	thumb_func_start InitUnits
InitUnits: @ 0x080174D8
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	ldr r7, _08017504 @ =0x08B92EB0
	movs r6, #0xff
_080174E0:
	adds r0, r5, #0
	ands r0, r6
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r4, [r0]
	cmp r4, #0
	beq _080174F6
	adds r0, r4, #0
	bl ClearUnit
	strb r5, [r4, #0xb]
_080174F6:
	adds r5, #1
	cmp r5, #0xff
	ble _080174E0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017504: .4byte 0x08B92EB0
