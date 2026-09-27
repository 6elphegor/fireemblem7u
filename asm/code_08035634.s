	.include "macro.inc"

	.syntax unified

	thumb_func_start CpPerform_PerformAction
CpPerform_PerformAction: @ 0x08035634
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0803564C @ =0x0203A85C
	ldrb r0, [r0, #0x11]
	cmp r0, #0x1b
	bne _08035654
	ldr r0, _08035650 @ =AiDummyAction
	b _08035706
	.align 2, 0
_0803564C: .4byte 0x0203A85C
_08035650: .4byte AiDummyAction
_08035654:
	ldr r0, _08035668 @ =0x0203A97C
	ldrb r0, [r0]
	cmp r0, #0xa
	bhi _08035708
	lsls r0, r0, #2
	ldr r1, _0803566C @ =_08035670
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08035668: .4byte 0x0203A97C
_0803566C: .4byte _08035670
_08035670: @ jump table
	.4byte _0803569C @ case 0
	.4byte _080356A4 @ case 1
	.4byte _080356B4 @ case 2
	.4byte _080356C4 @ case 3
	.4byte _080356D4 @ case 4
	.4byte _080356DC @ case 5
	.4byte _080356E4 @ case 6
	.4byte _080356EC @ case 7
	.4byte _080356F4 @ case 8
	.4byte _080356FC @ case 9
	.4byte _08035704 @ case 10
_0803569C:
	ldr r0, _080356A0 @ =AiDummyAction
	b _08035706
	.align 2, 0
_080356A0: .4byte AiDummyAction
_080356A4:
	ldr r0, _080356B0 @ =AiDummyAction
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl AiStartCombatAction
	b _08035708
	.align 2, 0
_080356B0: .4byte AiDummyAction
_080356B4:
	adds r0, r4, #0
	bl AiStartEscapeAction
	ldr r0, _080356C0 @ =AiEscapeAction
	b _08035706
	.align 2, 0
_080356C0: .4byte AiEscapeAction
_080356C4:
	adds r0, r4, #0
	bl AiStartStealAction
	ldr r0, _080356D0 @ =AiWaitAndClearScreenAction
	b _08035706
	.align 2, 0
_080356D0: .4byte AiWaitAndClearScreenAction
_080356D4:
	ldr r0, _080356D8 @ =AiPillageAction
	b _08035706
	.align 2, 0
_080356D8: .4byte AiPillageAction
_080356DC:
	ldr r0, _080356E0 @ =AiStaffAction
	b _08035706
	.align 2, 0
_080356E0: .4byte AiStaffAction
_080356E4:
	ldr r0, _080356E8 @ =AiUseItemAction
	b _08035706
	.align 2, 0
_080356E8: .4byte AiUseItemAction
_080356EC:
	ldr r0, _080356F0 @ =AiRefreshAction
	b _08035706
	.align 2, 0
_080356F0: .4byte AiRefreshAction
_080356F4:
	ldr r0, _080356F8 @ =AiTalkAction
	b _08035706
	.align 2, 0
_080356F8: .4byte AiTalkAction
_080356FC:
	ldr r0, _08035700 @ =AiRideBallistaAction
	b _08035706
	.align 2, 0
_08035700: .4byte AiRideBallistaAction
_08035704:
	ldr r0, _08035710 @ =AiExitBallistaAction
_08035706:
	str r0, [r4, #0x2c]
_08035708:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035710: .4byte AiExitBallistaAction
