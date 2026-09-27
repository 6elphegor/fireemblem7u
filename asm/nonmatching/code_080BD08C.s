	.include "macro.inc"

	.syntax unified

	thumb_func_start Proc_08DB9398_Loop
Proc_08DB9398_Loop: @ 0x080BD08C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x2c]
	adds r0, r0, r1
	str r0, [r4, #0x30]
	movs r5, #0x80
	lsls r5, r5, #1
	cmp r0, r5
	ble _080BD0A2
	str r5, [r4, #0x30]
_080BD0A2:
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bge _080BD0AC
	movs r0, #0
	str r0, [r4, #0x30]
_080BD0AC:
	ldr r0, _080BD0D0 @ =0x020072E0
	adds r1, r0, #0
	subs r1, #0x20
	ldr r2, [r4, #0x34]
	ldr r3, [r4, #0x30]
	bl sub_080BCFE8
	ldr r0, [r4, #0x30]
	cmp r0, r5
	beq _080BD0C4
	cmp r0, #0
	bne _080BD0CA
_080BD0C4:
	adds r0, r4, #0
	bl Proc_Break
_080BD0CA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BD0D0: .4byte 0x020072E0
