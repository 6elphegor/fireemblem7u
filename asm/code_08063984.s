	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxMantBatabata_Loop2
EfxMantBatabata_Loop2: @ 0x08063984
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	bl CheckEkrHitDone
	cmp r0, #1
	bne _080639BE
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateUnHidden
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	ldr r1, _080639C4 @ =0x02000010
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
_080639BE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080639C4: .4byte 0x02000010
