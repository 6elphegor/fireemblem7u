	.include "macro.inc"

	.syntax unified

	thumb_func_start ApplyEnabledMapChanges
ApplyEnabledMapChanges: @ 0x0802BC40
	push {r4, lr}
	ldr r4, _0802BC48 @ =0x0203A518
	b _0802BC72
	.align 2, 0
_0802BC48: .4byte 0x0203A518
_0802BC4C:
	ldrb r0, [r4, #2]
	cmp r0, #3
	beq _0802BC58
	cmp r0, #6
	beq _0802BC60
	b _0802BC70
_0802BC58:
	ldrb r0, [r4, #3]
	bl ApplyMapChange
	b _0802BC70
_0802BC60:
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _0802BC6A
	ldrb r0, [r4, #1]
	b _0802BC6C
_0802BC6A:
	ldrb r0, [r4]
_0802BC6C:
	bl ApplyMapChange
_0802BC70:
	adds r4, #8
_0802BC72:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802BC4C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
