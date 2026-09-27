	.include "macro.inc"

	.syntax unified

	thumb_func_start StatusHealEffect_PalSpriteAnim_SetOutlineIntensity
StatusHealEffect_PalSpriteAnim_SetOutlineIntensity: @ 0x08032CF4
	push {lr}
	adds r3, r1, #0
	cmp r3, #0x1f
	ble _08032CFE
	movs r3, #0x1f
_08032CFE:
	cmp r3, #0
	bge _08032D04
	movs r3, #0
_08032D04:
	ldr r0, _08032D1C @ =0x02022860
	lsls r1, r3, #0xa
	lsls r2, r3, #5
	adds r1, r1, r2
	adds r1, r1, r3
	ldr r2, _08032D20 @ =0x0000025E
	adds r0, r0, r2
	strh r1, [r0]
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_08032D1C: .4byte 0x02022860
_08032D20: .4byte 0x0000025E
