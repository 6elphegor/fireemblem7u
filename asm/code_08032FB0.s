	.include "macro.inc"

	.syntax unified

	thumb_func_start PoisonDamageDisplay_Init
PoisonDamageDisplay_Init: @ 0x08032FB0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08032FD4 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	bl MakePoisonDamageTargetList
	movs r0, #4
	bl sub_08024A88
	bl CountTargets
	cmp r0, #0
	bne _08032FD8
	adds r0, r4, #0
	bl Proc_End
	b _08032FE0
	.align 2, 0
_08032FD4: .4byte 0x0202BBF8
_08032FD8:
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
_08032FE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
