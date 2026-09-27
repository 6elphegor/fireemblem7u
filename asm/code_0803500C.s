	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803500C
sub_0803500C: @ 0x0803500C
	push {r4, lr}
	movs r4, #0
	ldr r1, _08035024 @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08035028
	bl AiDoBerserkAction
	b _0803503E
	.align 2, 0
_08035024: .4byte 0x0203A8EC
_08035028:
	bl sub_080375B8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803503E
	adds r4, #1
	cmp r4, #0xff
	ble _08035028
	bl AiExecFallbackScriptA
_0803503E:
	pop {r4}
	pop {r0}
	bx r0
