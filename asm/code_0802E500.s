	.include "macro.inc"

	.syntax unified

	thumb_func_start ResumeMapMainDuringPhase
ResumeMapMainDuringPhase: @ 0x0802E500
	push {r4, lr}
	adds r4, r0, #0
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	ldr r2, _0802E538 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E538: .4byte 0x03002870
