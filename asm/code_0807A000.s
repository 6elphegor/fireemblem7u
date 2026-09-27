	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A000
sub_0807A000: @ 0x0807A000
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0x41
_0807A008:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807A02C
	ldr r2, [r0]
	cmp r2, #0
	beq _0807A02C
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807A02C
	ldrb r2, [r2, #4]
	cmp r2, r5
	bne _0807A02C
	movs r0, #1
	b _0807A034
_0807A02C:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807A008
	movs r0, #0
_0807A034:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
