	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragon_ReloadTerrainEtc
EkrDragon_ReloadTerrainEtc: @ 0x08065444
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	bl Proc_End
	ldr r0, [r4, #0x58]
	bl Proc_End
	ldr r0, [r4, #0x48]
	bl Proc_End
	ldr r3, _080654C8 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateHidden
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	ldr r1, _080654CC @ =0x0203E010
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r4, #0x5c]
	bl NewEkrDragonBaseAppear
	ldr r0, _080654D0 @ =0x02024460
	ldr r1, _080654D4 @ =0x0000601F
	bl TmFill
	movs r0, #8
	bl EnableBgSync
	movs r0, #0x10
	bl EfxChapterMapFadeOUT
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080654C8: .4byte 0x03002870
_080654CC: .4byte 0x0203E010
_080654D0: .4byte 0x02024460
_080654D4: .4byte 0x0000601F
