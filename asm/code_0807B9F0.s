	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807B9F0
sub_0807B9F0: @ 0x0807B9F0
	push {r4, lr}
	movs r4, #0x41
_0807B9F4:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807BA0E
	ldr r1, [r0]
	cmp r1, #0
	beq _0807BA0E
	ldrb r1, [r1, #4]
	cmp r1, #0x86
	beq _0807BA0E
	bl ClearUnit
_0807BA0E:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807B9F4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
