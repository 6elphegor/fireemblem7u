	.include "macro.inc"

	.syntax unified

	thumb_func_start DidUnitDie
DidUnitDie: @ 0x0802F89C
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _0802F8B4
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	cmp r0, #0x86
	beq _0802F8B4
	movs r0, #1
	b _0802F8B6
_0802F8B4:
	movs r0, #0
_0802F8B6:
	pop {r4}
	pop {r1}
	bx r1
