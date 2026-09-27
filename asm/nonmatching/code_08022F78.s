	.include "macro.inc"

	.syntax unified

	thumb_func_start StealCommandUsability
StealCommandUsability: @ 0x08022F78
	push {r4, lr}
	ldr r4, _08022FAC @ =0x03004690
	ldr r2, [r4]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08022FA8
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022FA8
	adds r0, r2, #0
	bl MakeTargetListForSteal
	bl CountTargets
	cmp r0, #0
	bne _08022FB0
_08022FA8:
	movs r0, #3
	b _08022FC0
	.align 2, 0
_08022FAC: .4byte 0x03004690
_08022FB0:
	ldr r0, [r4]
	bl GetUnitItemCount
	cmp r0, #5
	beq _08022FBE
	movs r0, #1
	b _08022FC0
_08022FBE:
	movs r0, #2
_08022FC0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
