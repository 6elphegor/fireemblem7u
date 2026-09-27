	.include "macro.inc"

	.syntax unified

	thumb_func_start IsAnimSoundInPositionMaybe
IsAnimSoundInPositionMaybe: @ 0x08067C6C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetProperAnimSoundLocation
	movs r2, #2
	ldrsh r1, [r4, r2]
	adds r5, r0, r1
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08067C8A
	cmp r5, #0x58
	bgt _08067C92
	b _08067C8E
_08067C8A:
	cmp r5, #0x97
	ble _08067C92
_08067C8E:
	movs r0, #1
	b _08067C94
_08067C92:
	movs r0, #0
_08067C94:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
