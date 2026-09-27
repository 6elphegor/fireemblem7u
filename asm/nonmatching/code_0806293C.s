	.include "macro.inc"

	.syntax unified

	thumb_func_start efxYushaSpinShieldOBJ_806CDA4
efxYushaSpinShieldOBJ_806CDA4: @ 0x0806293C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	bl CheckEkrHitDone
	cmp r0, #1
	bne _08062996
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _08062970
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08062968
	ldr r0, _08062964 @ =0x08BAECBC
	b _08062986
	.align 2, 0
_08062964: .4byte 0x08BAECBC
_08062968:
	ldr r0, _0806296C @ =0x08BADA1C
	b _08062986
	.align 2, 0
_0806296C: .4byte 0x08BADA1C
_08062970:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08062984
	ldr r0, _08062980 @ =0x08BB125C
	b _08062986
	.align 2, 0
_08062980: .4byte 0x08BB125C
_08062984:
	ldr r0, _0806299C @ =0x08BAFF8C
_08062986:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_08062996:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806299C: .4byte 0x08BAFF8C
