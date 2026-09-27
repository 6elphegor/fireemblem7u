	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08019B40
sub_08019B40: @ 0x08019B40
	push {r4, r5, r6, lr}
	ldr r4, _08019B94 @ =0x02030A90
	ldr r5, _08019B98 @ =0x000003FF
	adds r0, r5, #0
	ldrh r1, [r4]
	ands r0, r1
	movs r6, #0x80
	lsls r6, r6, #3
	adds r0, r0, r6
	adds r4, #2
	bl SetBlankChr
	adds r0, r5, #0
	ldrh r1, [r4]
	ands r0, r1
	adds r0, r0, r6
	adds r4, #2
	bl SetBlankChr
	adds r0, r5, #0
	ldrh r1, [r4]
	ands r0, r1
	adds r0, r0, r6
	adds r4, #2
	bl SetBlankChr
	ldrh r4, [r4]
	ands r5, r4
	adds r5, r5, r6
	adds r0, r5, #0
	bl SetBlankChr
	ldr r1, _08019B9C @ =0x02022860
	movs r0, #0x86
	lsls r0, r0, #7
	strh r0, [r1]
	bl EnablePalSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08019B94: .4byte 0x02030A90
_08019B98: .4byte 0x000003FF
_08019B9C: .4byte 0x02022860
