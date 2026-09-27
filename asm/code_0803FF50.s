	.include "macro.inc"

	.syntax unified

	thumb_func_start SioPostBattle_StartMusicProc
SioPostBattle_StartMusicProc: @ 0x0803FF50
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803FF70 @ =0x08B98F74
	adds r1, r4, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x42
	adds r4, #0x44
	ldrb r0, [r0]
	ldrb r4, [r4]
	cmp r0, r4
	bne _0803FF74
	movs r0, #1
	b _0803FF76
	.align 2, 0
_0803FF70: .4byte 0x08B98F74
_0803FF74:
	movs r0, #0
_0803FF76:
	str r0, [r1, #0x58]
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1
